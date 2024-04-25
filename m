Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C668B1A8C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532E10F8B0;
	Thu, 25 Apr 2024 06:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3B510F898
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:02:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsBa-0001Th-HB; Thu, 25 Apr 2024 08:02:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsBU-00ECvV-2D; Thu, 25 Apr 2024 08:02:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rzsBT-008M1e-37;
 Thu, 25 Apr 2024 08:02:15 +0200
Date: Thu, 25 Apr 2024 08:02:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xilin Wu <wuxilin123@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Junhao Xie <bigfoot@classfun.cn>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
Message-ID: <rzxzqgx65m7yo2btzh5dzcxuqquszujdvffq2dippdak2qdx7c@g77efrhjyure>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="be7227a7w5ahl2v7"
Content-Disposition: inline
In-Reply-To: <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--be7227a7w5ahl2v7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 24, 2024 at 11:29:07PM +0800, Xilin Wu via B4 Relay wrote:
> From: Junhao Xie <bigfoot@classfun.cn>
>=20
> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
>=20
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>

Missing S-o-b for patch sender.

> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-sn3112.c | 336 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 347 insertions(+)
>=20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 1dd7921194f5..e21c37c7991e 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -553,6 +553,16 @@ config PWM_SL28CPLD
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-sl28cpld.
> =20
> +config PWM_SN3112
> +	tristate "SI-EN SN3112 PWM driver"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Generic PWM framework driver for SI-EN SN3112 LED controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-sn3112.
> +
>  config PWM_SPEAR
>  	tristate "STMicroelectronics SPEAr PWM support"
>  	depends on PLAT_SPEAR || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 90913519f11a..6aab2d113159 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+=3D pwm-rz-mtu3.o
>  obj-$(CONFIG_PWM_SAMSUNG)	+=3D pwm-samsung.o
>  obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
>  obj-$(CONFIG_PWM_SL28CPLD)	+=3D pwm-sl28cpld.o
> +obj-$(CONFIG_PWM_SN3112)	+=3D pwm-sn3112.o
>  obj-$(CONFIG_PWM_SPEAR)		+=3D pwm-spear.o
>  obj-$(CONFIG_PWM_SPRD)		+=3D pwm-sprd.o
>  obj-$(CONFIG_PWM_STI)		+=3D pwm-sti.o
> diff --git a/drivers/pwm/pwm-sn3112.c b/drivers/pwm/pwm-sn3112.c
> new file mode 100644
> index 000000000000..38ef948602a3
> --- /dev/null
> +++ b/drivers/pwm/pwm-sn3112.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for SN3112 12-channel 8-bit PWM LED controller
> + *
> + * Copyright (c) 2024 Junhao Xie <bigfoot@classfun.cn>
> + *
Please document here some hardware features in the same format as e.g.
pwm-sl28cpld.c such that

	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c

can easily extract it. Interesting facts that I want to have documented
are:

 - How does the HW behave on reconfiguration, i.e. does it complete the
   active period or is it aborted and can it happen that the signal
   gliches (e.g. because it emits for a moment a signal using the old
   period but the new duty cycle).

 - How does the HW behave on disable? Does it complete the active
   period? Does it emit low? Or the inactive level? Or does it freeze?

 - "Doesn't support read-back of configured output" belongs here.

 - Only supports a single fixed period and normal polarity.

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define SN3112_CHANNELS 12
> +#define SN3112_REG_ENABLE 0x00
> +#define SN3112_REG_PWM_VAL 0x04
> +#define SN3112_REG_PWM_EN 0x13
> +#define SN3112_REG_APPLY 0x16
> +#define SN3112_REG_RESET 0x17
> +
> +struct sn3112 {
> +	struct device *pdev;

pdev is a usual name for pointers to struct platform_device or struct
pci_device. For struct device please use "dev".

> +	struct regmap *regmap;
> +	struct mutex lock;
> +	struct regulator *vdd;
> +	uint8_t pwm_val[SN3112_CHANNELS];
> +	uint8_t pwm_en_reg[3];
> +	bool pwm_en[SN3112_CHANNELS];
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	struct gpio_desc *sdb;
> +#endif
> +};
> +
> +static int sn3112_write_reg(struct sn3112 *priv, unsigned int reg,
> +			    unsigned int val)
> +{
> +	int err;
> +
> +	dev_dbg(priv->pdev, "request regmap_write 0x%x 0x%x\n", reg, val);
> +	err =3D regmap_write(priv->regmap, reg, val);
> +	if (err)
> +		dev_warn_ratelimited(
> +			priv->pdev,
> +			"regmap_write to register 0x%x failed: %pe\n", reg,
> +			ERR_PTR(err));
> +
> +	return err;
> +}
> +
> +static int sn3112_set_en_reg(struct sn3112 *priv, unsigned int channel,
> +			     bool enabled, bool write)
> +{
> +	unsigned int reg, bit;
> +
> +	if (channel >=3D SN3112_CHANNELS)
> +		return -EINVAL;
> +
> +	/* LED_EN1: BIT5:BIT3 =3D OUT3:OUT1 */
> +	if (channel >=3D 0 && channel <=3D 2)
> +		reg =3D 0, bit =3D channel + 3;
> +	/* LED_EN2: BIT5:BIT0 =3D OUT9:OUT4 */
> +	else if (channel >=3D 3 && channel <=3D 8)
> +		reg =3D 1, bit =3D channel - 3;
> +	/* LED_EN3: BIT2:BIT0 =3D OUT12:OUT10 */
> +	else if (channel >=3D 9 && channel <=3D 11)
> +		reg =3D 2, bit =3D channel - 9;
Please use ; instead of , and proper { }.

And huh, this is inconsitent. Is it possible to renumber somehow such
that this simplifies to

	reg =3D channel / 3;
	bit =3D channel % 3;

?=20
> +	else
> +		return -EINVAL;
> +
> +	dev_dbg(priv->pdev, "channel %u enabled %u\n", channel, enabled);
> +	dev_dbg(priv->pdev, "reg %u bit %u\n", reg, bit);
> +	if (enabled)
> +		set_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
> +	else
> +		clear_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
> +	dev_dbg(priv->pdev, "set enable reg %u to %u\n", reg,
> +		priv->pwm_en_reg[reg]);

Even for dev_dbg this seems excessive. I guess now that the driver works
at least for you, you can drop several of them.

> +	if (!write)
> +		return 0;
> +	return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
> +				priv->pwm_en_reg[reg]);
> +}
> +
> +static int sn3112_set_val_reg(struct sn3112 *priv, unsigned int channel,
> +			      uint8_t val, bool write)
> +{
> +	if (channel >=3D SN3112_CHANNELS)
> +		return -EINVAL;
> +	priv->pwm_val[channel] =3D val;
> +	dev_dbg(priv->pdev, "set value reg %u to %u\n", channel,
> +		priv->pwm_val[channel]);
> +
> +	if (!write)
> +		return 0;
> +	return sn3112_write_reg(priv, SN3112_REG_PWM_VAL + channel,
> +				priv->pwm_val[channel]);
> +}
> +
> +static int sn3112_write_all(struct sn3112 *priv)
> +{
> +	int i, ret;
> +
> +	/* regenerate enable register values */
> +	for (i =3D 0; i < SN3112_CHANNELS; i++) {
> +		ret =3D sn3112_set_en_reg(priv, i, priv->pwm_en[i], false);
> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
> +	/* use random value to clear all registers */
> +	ret =3D sn3112_write_reg(priv, SN3112_REG_RESET, 0x66);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	/* set software enable register */
> +	ret =3D sn3112_write_reg(priv, SN3112_REG_ENABLE, 1);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	/* rewrite pwm value register */
> +	for (i =3D 0; i < SN3112_CHANNELS; i++) {
> +		ret =3D sn3112_write_reg(priv, SN3112_REG_PWM_VAL + i,
> +				       priv->pwm_val[i]);
> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
> +	/* rewrite pwm enable register */
> +	for (i =3D 0; i < 3; i++) {
> +		ret =3D sn3112_write_reg(priv, SN3112_REG_PWM_EN + i,
> +				       priv->pwm_en_reg[i]);
> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
> +	/* use random value to apply changes */
> +	ret =3D sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	dev_dbg(priv->pdev, "reinitialized\n");
> +	return 0;
> +}
> +
> +static int sn3112_pwm_request(struct pwm_chip *chip, struct pwm_device *=
pwm)
> +{
> +	struct sn3112 *priv =3D pwmchip_get_drvdata(chip);
> +
> +	if (pwm->hwpwm >=3D SN3112_CHANNELS)
> +		return -EINVAL;

You don't need to handle that, the pwm core cares for only passing sane
values.

> +
> +	dev_dbg(priv->pdev, "sn3112 request channel %u\n", pwm->hwpwm);
> +	pwm->args.period =3D 1000000;

No, that yields too much surprises. Just handle that in .apply()

> +	return 0;
> +}
> +
> +static int sn3112_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	u64 val =3D 0;
> +	struct sn3112 *priv =3D pwmchip_get_drvdata(chip);
> +
> +	if (pwm->hwpwm >=3D SN3112_CHANNELS)
> +		return -EINVAL;
> +
> +	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	if (state->period <=3D 0)
> +		return -EINVAL;

Drop sanity checking. Only do:

	if (state->period < MY_FIXED_PERIOD)
		return -EINVAL;

	duty_cycle =3D min(state->duty_cycle, MY_FIXED_PERIOD);

> +
> +	val =3D mul_u64_u64_div_u64(state->duty_cycle, 0xff, state->period);
> +	dev_dbg(priv->pdev, "duty_cycle %llu period %llu\n", state->duty_cycle,
> +		state->period);
> +	dev_dbg(priv->pdev, "set channel %u value to %llu\n", pwm->hwpwm, val);
> +	dev_dbg(priv->pdev, "set channel %u enabled to %u\n", pwm->hwpwm,
> +		state->enabled);
> +
> +	mutex_lock(&priv->lock);
> +	sn3112_set_en_reg(priv, pwm->hwpwm, state->enabled, true);
> +	sn3112_set_val_reg(priv, pwm->hwpwm, val, true);
> +	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +	mutex_unlock(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops sn3112_pwm_ops =3D {
> +	.apply =3D sn3112_pwm_apply,
> +	.request =3D sn3112_pwm_request,
> +};
> +
> +static const struct regmap_config sn3112_regmap_i2c_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D 24,
> +	.cache_type =3D REGCACHE_NONE,
> +};
> +
> +static int sn3112_pwm_probe(struct i2c_client *client)
> +{
> +	struct pwm_chip *chip;
> +	struct sn3112 *priv;
> +	int ret, i;
> +
> +	dev_dbg(&client->dev, "probing\n");
> +	chip =3D devm_pwmchip_alloc(&client->dev, SN3112_CHANNELS, sizeof(*priv=
));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +	priv =3D pwmchip_get_drvdata(chip);
> +	priv->pdev =3D &client->dev;
> +
> +	/* initialize sn3112 (chip does not support read command) */
> +	for (i =3D 0; i < SN3112_CHANNELS; i++)
> +		priv->pwm_en[i] =3D false;
> +	for (i =3D 0; i < SN3112_CHANNELS; i++)
> +		priv->pwm_val[i] =3D 0;
> +	for (i =3D 0; i < 3; i++)
> +		priv->pwm_en_reg[i] =3D 0;

*priv is already zerod.

> +	/* enable sn5112 power vdd */
> +	priv->vdd =3D devm_regulator_get(priv->pdev, "vdd");
> +	if (IS_ERR(priv->vdd)) {
> +		ret =3D PTR_ERR(priv->vdd);
> +		dev_err(priv->pdev, "Unable to get vdd regulator: %d\n", ret);

Please use dev_err_probe()

> +		return ret;
> +	}
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* sn5112 hardware shutdown pin */
> +	priv->sdb =3D devm_gpiod_get_optional(priv->pdev, "sdb", GPIOD_OUT_LOW);
> +	if (PTR_ERR(priv->sdb) =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

devm_gpiod_get_optional has a dummy implementation, so please drop the
#ifdef. Also handle all errors, not only EPROBE_DEFER.

> +#endif
> +
> +	/* enable sn5112 power vdd */
> +	ret =3D regulator_enable(priv->vdd);
> +	if (ret < 0) {
> +		dev_err(priv->pdev, "Unable to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->regmap =3D devm_regmap_init_i2c(client, &sn3112_regmap_i2c_config=
);
> +	if (IS_ERR(priv->regmap)) {
> +		ret =3D PTR_ERR(priv->regmap);
> +		dev_err(priv->pdev, "Failed to initialize register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	i2c_set_clientdata(client, chip);
> +	mutex_init(&priv->lock);
> +
> +	chip->ops =3D &sn3112_pwm_ops;
> +	ret =3D pwmchip_add(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* disable hardware shutdown pin */
> +	if (priv->sdb)
> +		gpiod_set_value(priv->sdb, 0);
> +#endif
> +
> +	/* initialize registers */
> +	ret =3D sn3112_write_all(priv);
> +	if (ret !=3D 0) {
> +		dev_err(priv->pdev, "Failed to initialize sn3112: %d\n", ret);
> +		return ret;
> +	}

This happens too late? Once pwmchip_add() returns the hardware must be
ready.

> +
> +	dev_info(&client->dev,
> +		 "Found SI-EN SN3112 12-channel 8-bit PWM LED controller\n");

Please degrade that to dev_dbg (or drop completely).

> +	return 0;
> +}
> +
> +static void sn3112_pwm_remove(struct i2c_client *client)
> +{
> +	struct pwm_chip *chip =3D i2c_get_clientdata(client);
> +	struct sn3112 *priv =3D pwmchip_get_drvdata(chip);
> +
> +	dev_dbg(priv->pdev, "remove\n");
> +
> +	/* set software enable register */
> +	sn3112_write_reg(priv, SN3112_REG_ENABLE, 0);

hardware silencing has to happen only after pwmchip_remove().

> +
> +	/* use random value to apply changes */
> +	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* enable hardware shutdown pin */
> +	if (priv->sdb)
> +		gpiod_set_value(priv->sdb, 1);
> +#endif
> +
> +	/* power-off sn5112 power vdd */
> +	regulator_disable(priv->vdd);
> +
> +	pwmchip_remove(chip);
> +}
> +
> +static const struct i2c_device_id sn3112_id[] =3D {
> +	{ "sn3112", 0 },

Drop the 0, and please use named initializers.

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, sn3112_id);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sn3112_dt_ids[] =3D {
> +	{ .compatible =3D "si-en,sn3112-pwm", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sn3112_dt_ids);
> +#endif
> +
> +static struct i2c_driver sn3112_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "sn3112-pwm",
> +		.of_match_table =3D of_match_ptr(sn3112_dt_ids),
> +	},
> +	.probe =3D sn3112_pwm_probe,
> +	.remove =3D sn3112_pwm_remove,

Please use .remove_new

> +	.id_table =3D sn3112_id,
> +};
> +
> +module_i2c_driver(sn3112_i2c_driver);
> +
> +MODULE_AUTHOR("BigfootACA <bigfoot@classfun.cn>");

I'd prefer the realname here matching the patch author.

> +MODULE_DESCRIPTION("PWM driver for SI-EN SN3112");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--be7227a7w5ahl2v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYp8eYACgkQj4D7WH0S
/k4W1wf+J3R0px05E6JPq1gOpY4R/Zsz9DlGI3EHGDlgZecWgqbO6V5DNPdeLNK9
tlVKYVa6SQ1BI7zVFvEG8svZ3vdViPgA4D6n6Lbn4pvtXM1PQjaTW81JoiOHYHoL
0PPuRp82S5CEqLZ1P+qlunyGOhsA8GJSgl0fGCwmbSE8UcMpPjlyCMvGZuGfBa6q
B1lqNA7EQ05fFCHD6IPyah3Z/CpAE9TuyekE2fqBjEUGkvmNAwnGNNtIH7aIoT4P
tvVZYOVx/iSVRHIfLaI6vZH6QtHQ3y31uRhNGjvqkoS2E0KyG6dHxA26rvgdoJR3
rOCTeCr1iPCA+MSt3mIp7ZMrmbYy5A==
=vghj
-----END PGP SIGNATURE-----

--be7227a7w5ahl2v7--
