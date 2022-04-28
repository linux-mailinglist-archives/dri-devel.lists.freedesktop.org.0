Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062B5134B7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253C210E7C4;
	Thu, 28 Apr 2022 13:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1116.securemx.jp [210.130.202.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E5D10E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:16:48 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 23SDGbRK018424;
 Thu, 28 Apr 2022 22:16:37 +0900
X-Iguazu-Qid: 2wGrGTuS1I2Z8bnOL3
X-Iguazu-QSIG: v=2; s=0; t=1651151797; q=2wGrGTuS1I2Z8bnOL3;
 m=vTJ6ckY81jUCbBKkXlSrCMGDElvP52HN/qK932dNoWU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1112) id 23SDGahF017435
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 22:16:36 +0900
X-SA-MID: 37013503
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 4/4] MAINTAINERS: Add entries for Toshiba Visconti DNN image
 processing accelerator
Date: Thu, 28 Apr 2022 22:11:28 +0900
X-TSB-HOP2: ON
Message-Id: <20220428131128.5053-5-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd36acc87..a2e2bd719 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2796,12 +2796,14 @@ F:	Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
 F:	Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 F:	Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+F:	Documentation/devicetree/bindings/soc/visconti/
 F:	Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 F:	arch/arm64/boot/dts/toshiba/
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
 F:	drivers/gpio/gpio-visconti.c
 F:	drivers/pci/controller/dwc/pcie-visconti.c
 F:	drivers/pinctrl/visconti/
+F:	drivers/soc/visconti/
 F:	drivers/watchdog/visconti_wdt.c
 N:	visconti
 
-- 
2.17.1


