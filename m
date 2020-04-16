Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F821ABDE8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 12:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F42F6EB3A;
	Thu, 16 Apr 2020 10:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63236EB39
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:31:13 +0000 (UTC)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
 by baptiste.telenet-ops.be with bizsmtp
 id TNWz2200j4dKHqf01NWzN6; Thu, 16 Apr 2020 12:31:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0001cz-Q0; Thu, 16 Apr 2020 12:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0003zO-OP; Thu, 16 Apr 2020 12:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial 6/6] ASoC: Fix misspellings of "Analog Devices"
Date: Thu, 16 Apr 2020 12:30:58 +0200
Message-Id: <20200416103058.15269-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to https://www.analog.com/, the company name is spelled
"Analog Devices".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/codecs/ad1980.c  | 2 +-
 sound/soc/codecs/ad73311.c | 2 +-
 sound/soc/codecs/wm8782.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index c4414c725c1f945a..43b1337bac37f70f 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -2,7 +2,7 @@
 /*
  * ad1980.c  --  ALSA Soc AD1980 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Roy Huang <roy.huang@analog.com>
  * 		Cliff Cai <cliff.cai@analog.com>
  */
diff --git a/sound/soc/codecs/ad73311.c b/sound/soc/codecs/ad73311.c
index 10daf61f02940b46..b98bf19f594e097f 100644
--- a/sound/soc/codecs/ad73311.c
+++ b/sound/soc/codecs/ad73311.c
@@ -2,7 +2,7 @@
 /*
  * ad73311.c  --  ALSA Soc AD73311 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index aa5577e364d01360..f89855c616ebe6e6 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -7,7 +7,7 @@
  * Author: Johannes Stezenbach <js@sig21.net>
  *
  * based on ad73311.c
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
