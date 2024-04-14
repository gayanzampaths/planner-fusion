import ballerina/http;
import ballerina/time;

type Space record {|
    string key;
    string name;
    string owner;
    time:Date createdDate;
|};

Space space = {
    key: "key-1",
    name: "Test Space",
    owner: "gayans",
    createdDate: {year: 2024, month: 4, day: 14}
};

Space[] spaces = [space];

service /planner\-fusion on new http:Listener(9090) {
    resource function get space() returns Space[]|error? {

        return [space];
    };

    resource function post space(Space data) returns http:Created|error? {
        spaces.push(data);

        return http:CREATED;
    }

    resource function patch space/[string key](Space data) returns http:Ok|error? {
        return http:OK;
    }

    resource function delete space/[string key]() returns http:Ok | error {
        return http:OK;
    }
}
