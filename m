Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C312985892A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 23:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DCE10E6FF;
	Fri, 16 Feb 2024 22:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229E10E6FF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 22:50:29 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rb727-0005Zt-9A; Fri, 16 Feb 2024 23:50:15 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>,
	neil.armstrong@linaro.org
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quentin.schulz@theobroma-systems.com, mripard@kernel.org,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: add prefix for admatec
 GmbH
Date: Fri, 16 Feb 2024 23:50:13 +0100
Message-Id: <170812374212.3826997.17392581213989384706.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215090442.3513760-1-heiko@sntech.de>
References: <20240215090442.3513760-1-heiko@sntech.de>
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

On Thu, 15 Feb 2024 10:04:41 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> admatec GmbH is a german supplier for industrial displays.
> 
> 

Applied, thanks!

Adding the link to the manufacturer Conor suggested.

[1/2] dt-bindings: vendor-prefixes: add prefix for admatec GmbH
      commit: 9de552935b6ceaa113d205232fde70e5345bdf29
[2/2] dt-bindings: display: panel-lvds: Add compatible for admatec 9904370 panel
      commit: c530379a6876eb4c9c4a83f1b65d8cd9d66ee229

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
