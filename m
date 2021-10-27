Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7B43CB6B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C984D6E89D;
	Wed, 27 Oct 2021 14:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399E6E89D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:01:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RB7hVo012181; 
 Wed, 27 Oct 2021 15:56:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SonikwPLivf5Wf37m9QGw9Dbl0nfvPwQE843HNWkcTc=;
 b=WzTh3e1T+lbbR0asJHNFou5wy8ymDy2S+R6rPJyrqAzstKAMap8J47xdHxMl2RgiS0FA
 GmPrGi2x3OeVUYtOCqe6mJeZ8Qnqgr3AqxOk450p67gxTAT52rOaRO+ShqQ7sCyKWJnI
 akk/0WBtQxfWvGvmNBBFHNJxGj2edblZplh16L99+Icve2UKQ3u0Y7rBt6zEBSDWSZG4
 hjGa2jeJcZtnU6/w30poOeFwKUFpEn8VYHXLg/vCxFZY0lY9ng2HR45n3c8vhiJwnllz
 Jwmg2Jsob0VeZLHlpEugPKm678F0Rb6n0r6pPAbgzUx5bSgYL/7OoJXo5clDxcl3kg2U lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bxputnapf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 15:56:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BC43100034;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3742D22D168;
 Wed, 27 Oct 2021 15:56:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 15:56:35 +0200
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <joe@perches.com>
CC: Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>,
 stephen boyd <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>,
 david airlie <airlied@linux.ie>, daniel vetter <daniel@ffwll.ch>,
 thierry reding <thierry.reding@gmail.com>, sam ravnborg <sam@ravnborg.org>,
 yannick fertre <yannick.fertre@foss.st.com>, "philippe
 cornu" <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>,
 vinod koul <vkoul@kernel.org>, ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, baolin wang
 <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>, "lars-peter
 clausen" <lars@metafoo.de>, olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matt Mackall <mpm@selenic.com>, "Alessandro
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Viresh Kumar <viresh.kumar@linaro.org>, "Ahmad
 Fatoum" <a.fatoum@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>,
 dillon min <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Sebastian Reichel
 <sre@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, pascal Paillet
 <p.paillet@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dmaengine@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Message-ID: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
Date: Wed, 27 Oct 2021 15:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
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

Hi Marc

+Joe Perches

On 10/27/21 8:11 AM, Patrice CHOTARD wrote:
> Hi Marc
> 
> On 10/20/21 1:39 PM, Marc Zyngier wrote:
>> On Wed, 20 Oct 2021 08:45:02 +0100,
>> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>> On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
>>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>
>>>> Not all @st.com email address are concerned, only people who have
>>>> a specific @foss.st.com email will see their entry updated.
>>>> For some people, who left the company, remove their email.
>>>>
>>>
>>> Please split simple address change from maintainer updates (removal,
>>> addition).
>>>
>>> Also would be nice to see here explained *why* are you doing this.
>>
>> And why this can't be done with a single update to .mailmap, like
>> anyone else does.
> 
> Thanks for the tips, yes, it will be simpler.
> 
> Thanks
> Patrice
> 
>>
>> 	M.
>>

I made a try by updating .mailmap with adding a new entry with my @foss.st.com email :

 Pali Rohár <pali@kernel.org> <pali.rohar@gmail.com>
 Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
+Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
 Patrick Mochel <mochel@digitalimplant.org>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>

But when running ./scripts/get_maintainer.pl Documentation/devicetree/bindings/arm/sti.yaml, by old email is still displayed

Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Patrice Chotard <patrice.chotard@st.com> (in file)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

By default, the get_maintainer.pl script is using .mailmap file ($email_use_mailmap = 1).

It seems there is an issue with get_maintainer.pl and maintainer name/e-mail found in yaml file ?

Thanks
Patrice
