document.addEventListener('turbo:load', function() {
  if (window.location.pathname === '/quizzes') {
    setTimeout(function() {
      const options = {
        completeOnFinish: true
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

      const tg = new tourguide.TourGuideClient({
        steps: steps,
        options: options,
      });
      tg.start();
    }, 100);
  }
});