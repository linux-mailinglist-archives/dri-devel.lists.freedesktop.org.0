Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EC7F1756
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CE210E042;
	Mon, 20 Nov 2023 15:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4E310E042
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 15:32:09 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r56Fo-0008VB-0z; Mon, 20 Nov 2023 16:32:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH V4 0/6] rockchip: Add Powkiddy RK2023
Date: Mon, 20 Nov 2023 16:31:53 +0100
Message-Id: <170049419903.1671702.16288351074631545361.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 14:25:30 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RK2023, which is extremely similar to
> existing Powkiddy RGB30 device.
> 
> Changes since V3:
>  - Corrected commit subject lines.
> 
> [...]

Applied, thanks!

[4/6] dt-bindings: arm: rockchip: Add Powkiddy RK2023
      commit: 213615d742f0c039ab73f8946ae18000cf2c7b65
[5/6] arm64: dts: rockchip: Update powkiddy,rgb30 include to rk2023 DTSI
      commit: 46d84ceb7eec85b60e8a5eb0dfb2fae6a1bf4166
[6/6] arm64: dts: rockchip: Add Powkiddy RK2023
      commit: e926380ea2a2b10d01069917e6d678ca818f6ad8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
