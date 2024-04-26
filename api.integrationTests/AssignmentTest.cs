using System.Net.Http.Json;

namespace api.integrationTests;

public class AssignmentTest
{
    [Fact]
    public async void List()
    {
        var application = new ApiWappFactory();
        var client = application.CreateClient();

        var response = await client.GetAsync("Assignment/List");
        response.EnsureSuccessStatusCode();

        var responseData = await response.Content.ReadFromJsonAsync<Assignment[]>();
        Assert.NotNull(responseData);
        Assert.Single(responseData);
    }
}