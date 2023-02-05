Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666568B030
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCB610E162;
	Sun,  5 Feb 2023 14:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66A10E162
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:09:44 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOfi4-00075Q-6S; Sun, 05 Feb 2023 15:09:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: (subset) [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Date: Sun,  5 Feb 2023 15:09:34 +0100
Message-Id: <167560616167.854266.15581661831063028156.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Dec 2022 15:22:14 +0100, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> 
> [...]

Applied, thanks!

[01/17] dt-bindings: display: rockchip: convert rockchip-lvds.txt to YAML
        commit: d567ca6ed9fd5fe594bca5e29717ff9e9631efba
[02/17] dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
        commit: cbfc73a3febdf14395ecdd738decd53835166662
[03/17] dt-bindings: display: dsi-controller: move clock-master property
        commit: a1b7455dc4a399a565353ceb7cce605b4b9db41a
[04/17] dt-bindings: display: bridge: snps,dw-mipi-dsi: fix clock properties
        commit: a90fa0adbeb07f11c08635364d206678d9e1b938
[05/17] dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to yaml
        commit: 0dac2102cf6baacba0d9d7804b0c163337f69839
[06/17] dt-bindings: display: bridge: convert analogix_dp.txt to yaml
        commit: 440112adadd3e273d2a2ff6e5d4b969ee03fda47
[07/17] dt-bindings: display: rockchip: convert analogix_dp-rockchip.txt to yaml
        commit: 9bb35d4c3230803345d5218676a7325b26823209

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
