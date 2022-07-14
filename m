Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616A574C0C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F47E10F157;
	Thu, 14 Jul 2022 11:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503A10F157
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:28:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2AA461CF0;
 Thu, 14 Jul 2022 11:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A4C341C6;
 Thu, 14 Jul 2022 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657798078;
 bh=tOGmD5u/m9ilA/glyEAQrd2KlEkkAMsHW3drN8WKV/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5WiL4mTT1a43S+B3rLO5E5wkRqZ3KWIFX4R+bXiXL2Dewy3zBY4HJfc42nlDyF57
 Y0UnraujQsDkAAXNarcSHVn8LnM2BnOJqIDPWwwrr1lwfjB6VkqPRcdfG6umF9GqtS
 KtOjOylKy/v0UOHIQ6ohhK/u7hrFUychRoxN34Ns0ivWRC/W18x3z9Rkw+YVIACThW
 W6InZslRmF/LCFxydbfpYAqiG3Bvy/TiP6kd6Adxn01TAAAyuehyU/yjaj5OjZAAXE
 pGXZ396EXSEnUgKimKA7VZ/aowwQDpuM2hFZ0wRPiATw+Jgs+kitZ4+yzeGhfRlVZ+
 G4OBG8DTzCyvA==
From: Lee Jones <lee@kernel.org>
To: lee.jones@linaro.org
Subject: [PATCH 6/8] dt-bindings: backlight: Update Lee Jones' email address
Date: Thu, 14 Jul 2022 12:25:31 +0100
Message-Id: <20220714112533.539910-7-lee@kernel.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220714112533.539910-1-lee@kernel.org>
References: <20220714112533.539910-1-lee@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Going forward, I'll be using my kernel.org for upstream work.

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 Documentation/devicetree/bindings/leds/backlight/common.yaml    | 2 +-
 .../devicetree/bindings/leds/backlight/gpio-backlight.yaml      | 2 +-
 .../devicetree/bindings/leds/backlight/led-backlight.yaml       | 2 +-
 .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml   | 2 +-
 .../devicetree/bindings/leds/backlight/pwm-backlight.yaml       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
index 702ba350d8698..3b60afbab68ba 100644
--- a/Documentation/devicetree/bindings/leds/backlight/common.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Common backlight properties
 
 maintainers:
-  - Lee Jones <lee.jones@linaro.org>
+  - Lee Jones <lee@kernel.org>
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 75cc569b9c558..3300451fcfd5e 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: gpio-backlight bindings
 
 maintainers:
-  - Lee Jones <lee.jones@linaro.org>
+  - Lee Jones <lee@kernel.org>
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
index f5822f4ea6679..0793d0adc4ec9 100644
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: led-backlight bindings
 
 maintainers:
-  - Lee Jones <lee.jones@linaro.org>
+  - Lee Jones <lee@kernel.org>
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index 08fe5cf8614a8..3c9b4054ed9a5 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TI LM3630A High-Efficiency Dual-String White LED
 
 maintainers:
-  - Lee Jones <lee.jones@linaro.org>
+  - Lee Jones <lee@kernel.org>
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
index fcb8429f3088c..78fbe20a17580 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: pwm-backlight bindings
 
 maintainers:
-  - Lee Jones <lee.jones@linaro.org>
+  - Lee Jones <lee@kernel.org>
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
-- 
2.37.0.144.g8ac04bfd2-goog

