const options = {
  completeOnFinish: boolean = true
};

const steps = [
  {
    title: "登録有難うございます😆",
    content: "KnowledgeTreeQuizへようこそ！",
    target: "#one",
    order: 1,
  },{
    title: "クイズはこちらから",
    content: "ここでクイズに回答してみてください",
    target: "#two",
    order: 2
  },{
    title: "投稿はこちら",
    content: "あなたの技術をクイズにして投稿してみましょう",
    target: "#three",
    order: 3
  },{
    title: "最後に",
    content: "お問い合わせはこちらからお願いします",
    target: "#four",
    order: 4,
  },{
    title: "みんなで知識の木を育てましょう",
    content: "たくさんの投稿をお待ちしております",
    target: "#five",
    order: 5,
  }
]

//completeOnFinish: trueにすると、最後のステップで終了する


const tg = new tourguide.TourGuideClient({
  steps: steps,
  options: options,
});
tg.start();
