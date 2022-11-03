Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDB6192D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 09:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E80310E0A8;
	Fri,  4 Nov 2022 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBED10E65D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 16:37:20 +0000 (UTC)
Received: from opme11oxm02aub.pom.fr.intraorange ([10.110.82.2])
 by smtp.orange.fr with ESMTP
 id qdDQoMDFB94emqdDQoFLjH; Thu, 03 Nov 2022 17:37:17 +0100
X-ME-Helo: opme11oxm02aub.pom.fr.intraorange
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Thu, 03 Nov 2022 17:37:17 +0100
X-ME-IP: 92.184.110.22
Date: Thu, 3 Nov 2022 17:37:16 +0100 (CET)
From: Jarzmik Robert <jarzmik.robert@orange.fr>
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 robert.jarzmik@free.fr
Message-ID: <803778517.2279639.1667493436959.JavaMail.open-xchange@opme11oxm02aub.pom.fr.intraorange>
In-Reply-To: <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <m2r0z3h5yr.fsf@sopl295.home>
 <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.6.3-Rev65
X-Originating-IP: 92.184.110.22
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Fri, 04 Nov 2022 08:33:49 +0000
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
Reply-To: Jarzmik Robert <jarzmik.robert@orange.fr>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, sre@kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mtd@lists.infradead.org,
 philipp.zabel@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@wantstofly.org, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>, marek.vasut@gmail.com,
 Alan Stern <stern@rowland.harvard.edu>, linux-input@vger.kernel.org,
 slapin@ossfans.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lost.distance@yahoo.com, Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-fbdev@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, mkpetch@internode.on.net,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 lgirdwood@gmail.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, patches@opensource.cirrus.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns=3D"http://www.w3.org/1999/xhtml"><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
"/>
 </head><body style=3D"font-family: arial,helvetica,sans-serif; font-size: =
13pt"><p>I&#39;m sorry Arnd, my mailer messed up again, and instead of usin=
g my normal <a href=3D"mailto:robert.jarzmik@free.fr,">robert.jarzmik@free.=
fr,</a> it used my ISP mail ...<br></p><p>This answer will most probably lo=
ok horrible, probably in html with no way of using plain text... sorry for =
that.<br></p><p><br></p><p>The reason you&#39;re not seeing the AC97_BUS_NE=
W used is because this becomes visible only in device-tree files, which wer=
e posted (for mioa701 for example) but never properly reviewed nor merged.<=
br></p><p>As from memory, at least mioa701, zylonite, em_x270 are DT ported=
, ie. there is a DT file which makes them boot. For the mioa701, the DT fil=
e offers the same functionnality, ie. all drivers in mioa701.c legacy file =
are working as well in a DT variant (not using mioa701.c obviously).<br></p=
><p><br></p><p>&#62; Any idea where I went wrong here? Did I make a mistake=
 in following the Kconfig dependencies, or are some parts of this<br>incorr=
ectly annotated?</p><p>I don&#39;t think you did a mistake, I think I did. =
When I saw the patch of &#34;deprecation&#34; of mioa701 and all the other =
pxa files, I took it that the platform-device was deprecated, and was to be=
 removed. This is the right thing to do in my opinion. I wouldn&#39;t mind =
if all board file go actually (expect the QEMU one), as this would leave on=
ly the boards with proper DT support, and would remove some clutter from th=
e kernel.</p><p>I also thought the drivers won&#39;t get touched by the pur=
ge, exception made of &#34;platform similar ones&#34;, such as in the sound=
 tree (sound/soc/pxa) where we have some of them, and maybe mfd tree.</p><p=
><br></p><p>Cheers.</p><p>--</p><p>Robert</p></body></html>
