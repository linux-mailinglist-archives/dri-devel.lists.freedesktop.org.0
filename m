Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680707CB502
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF910E181;
	Mon, 16 Oct 2023 21:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585F10E181
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:02:23 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsUj6-0000t6-Mb; Mon, 16 Oct 2023 23:02:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 0/5] Add Support for RK3566 Powkiddy RGB30
Date: Mon, 16 Oct 2023 23:02:11 +0200
Message-Id: <169749012381.1030145.4153782284294309362.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 kernel@puri.sm, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, agx@sigxcpu.org, Chris Morgan <macromorgan@hotmail.com>,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Oct 2023 13:39:13 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RGB30 handheld gaming console.
> 
> Chris Morgan (5):
>   dt-bindings: vendor-prefixes: document Powkiddy
>   dt-bindings: panel: Add Powkiddy RGB30 panel compatible
>   drm/panel: st7703: Add Powkiddy RGB30 Panel Support
>   dt-bindings: arm64: rockchip: add Powkiddy RGB30
>   arm64: dts: rockchip: add support for Powkiddy RGB30
> 
> [...]

Applied, thanks!

[4/5] dt-bindings: arm64: rockchip: add Powkiddy RGB30
      commit: 64d0de4f65c2951ccdc7a7aebe8a7e3455946f5f
[5/5] arm64: dts: rockchip: add support for Powkiddy RGB30
      commit: 1e9ac3e8a6a9d4da9efbad2d8e95cc1140e0e23f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
