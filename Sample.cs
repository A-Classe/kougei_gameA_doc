//ディレクトリ構造に準ずる(Scriptsは含まない)
namespace Test.Sample
{
    class Program : IInterface
    {
        //constであっても命名規則は変えない
        private const float tickRate = 10f;
        public int StartTime = 1;

        private int pointA;
        
        //regionは基本使わなくていいかも(クラスの全体像が把握しにくいので)
        //使う必要があればクラスを分けることを検討してみて
        //#region Setup Function

        private void MethodA() { }

        private int MethodB(int args)
        {
            return args;
        }

        private int MethodC(int pointA)
        {
            //名前付き引数はつけてもつけなくても
            //統一した方がいい？
            MethodB(args: 3);
            
            //同義の場合はthisで自身のインスタンスを指して代入
            this.pointA = pointA;
        }
    }
}

