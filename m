Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6468AAD90
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0C10E324;
	Fri, 19 Apr 2024 11:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013CE10E324
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:19:07 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.intern)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rxmGl-0000RL-Hh; Fri, 19 Apr 2024 13:19:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, andy.yan@rock-chips.com,
 hjc@rock-chips.com
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 robh@kernel.org, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 markyao0591@gmail.com, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, daniel@ffwll.ch, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add #sound-dai-cells
 property to rockchip dw hdmi
Date: Fri, 19 Apr 2024 13:18:57 +0200
Message-Id: <171352551023.2525344.13101791805180451568.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
References: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Apr 2024 17:38:05 +0200, Johan Jonker wrote:
> The Rockchip DWC HDMI TX Encoder can take one I2S input and transmit it
> over the HDMI output. Add #sound-dai-cells (= 0) to the binding for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: display: add #sound-dai-cells property to rockchip dw hdmi
      commit: e58414e44b5315230de829ed88a63611646907ac
[2/3] dt-bindings: display: add #sound-dai-cells property to rockchip rk3066 hdmi
      commit: 9be3eb5d6ee57662a22b56153c7ee39265685455
[3/3] dt-bindings: display: add #sound-dai-cells property to rockchip inno hdmi
      commit: b1ee6bd3ea954d081bfb1d5559ce3e78ef40443a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
