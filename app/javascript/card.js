const pay = () => {
  Payjp.setPublicKey("pk_test_b94b0a5843698f4b885b1e42");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_shipping_address[number]"),
      cvc: formData.get("order_shipping_address[cvc]"),
      exp_month: formData.get("order_shipping_address[exp_month]"),
      exp_year: `20${formData.get("order_shipping_address[exp_year]")}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);