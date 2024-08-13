
function LinkPorts(output_port, input_port)
  local args = {
    -- The node and port to connect FROM
    [ "link.output.node" ] = output_port.properties["node_id"],
    [ "link.output.port" ] = output_port.properties["object.id"],

    -- The node and port to connect TO
    [ "link.input.node" ] = input_port.properties["node_id"],
    [ "link.input.port" ] = input_port.properties["object.id"],

    -- janky hack mate?
    ["object.id"] = nil,

    -- Make sure that the link continues to exist.
    ["object.linger"] = true,

    ["node.description"] = "Created by AutoLinkPorts",
  }

  local link = Link("link-factory", args)
  link:activate(1)

  return link
end

function AutoLinkPorts(args)
  local input_constraint = args["input"]
  local output_constraint = args["output"]
  local connections = args["connect"]

  local links = {}

  local input_om = ObjectManager {
    Interest {
      type = "port",
      input_constraint,
      Constraint {
        "port.direction", "equals", "in"
      }
    }
  }

  local output_om = ObjectManager {
    Interest {
      type = "port",
      output_constraint,
      Constraint {
        "port.direction", "equals", "out"
      }
    }
  }

  local all_links = ObjectManager {
    Interest {
      type = "Link",
    }
  }

  local except_om = nil

  if args["unless"] then
    except_om = ObjectManager {
      Interest {
        type = "port",
        args["unless"],
        Constraint { "port.direction", "equals", "in" }
      }
    }
  end

  function _connect()
    local delete_links = except_om and except_om:get_n_objects() > 0

    if delete_links then
      for _i, link in pairs(links) do
        link:request_destroy()
      end

      links = {}

      return
    end

    for output_name, input_names in pairs(connections) do
      local input_names = input_names[1] == nil and {input_names} or input_names

      if delete_links then
      else
        local output = output_om:lookup { Constraint { "audio.channel", "equals", output_name } }

        for _i, input_name in pairs(input_names) do
          local input = input_om:lookup { Constraint { "audio.channel", "equals", input_name } }
          local link = LinkPorts(output, input)

          if link then
            table.insert(links, link)
          end
        end
      end
    end
  end

  output_om:connect("object-added", _connect)
  input_om:connect("object-added", _connect)
  all_links:connect("object-added", _connect)

  output_om:activate()
  input_om:activate()
  all_links:activate()

  if except_om then
    except_om:connect("object-added", _connect)
    except_om:connect("object-removed", _connect)
    except_om:activate()
  end
end


AutoLinkPorts {
  output = Constraint { "application.name", "matches", "Firefox" },
  input = Constraint { "node.name", "matches", "Firefox-Audio"},

  connect = {
    ["FL"] = "FL",
    ["FR"] = "FR",
  }
}
