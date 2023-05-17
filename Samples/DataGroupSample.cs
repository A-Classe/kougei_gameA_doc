namespace work
{
    public class DataGroup
    {
        public int Id { get; private set; }
        public string Name { get; private set; }
        public string Color { get; private set; }
        // 他のプロパティも同様に定義...
        
        private DataGroup(int id, string name, string color)
        {
            Id = id;
            Name = name;
            Color = color;
        }

        public static readonly DataGroup Group1 = new(0, "A", "green");
        public static readonly DataGroup Group2 = new(1, "B", "yellow");
        public static readonly DataGroup Group3 = new(2, "C", "orange");
        public static readonly DataGroup Group4 = new(3, "D", "purple");
        public static readonly DataGroup Group5 = new(4, "E", "blue");

        public static IEnumerable<DataGroup> All
        {
            get
            {
                return new[]
                {
                    Group1,
                    Group2,
                    Group3,
                    Group4,
                    Group5
                };
            }
        }
    }
    
    internal class Program
    {
        static void Main()
        {
            foreach (var group in DataGroup.All)
            {
                Console.WriteLine(group.Color);
            }
            
            var dataGroup = DataGroup.Group2;

            Console.WriteLine(dataGroup.Color);
            Console.WriteLine(dataGroup.Id);
            Console.WriteLine(dataGroup.Name);
            
        }
    }
}
