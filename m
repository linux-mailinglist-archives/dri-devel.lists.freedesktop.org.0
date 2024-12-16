Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C249F2E0D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8167810E197;
	Mon, 16 Dec 2024 10:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mXTbB8PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D210E197
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:19:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6FB5FA40E18;
 Mon, 16 Dec 2024 10:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66899C4CED0;
 Mon, 16 Dec 2024 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734344383;
 bh=UEm4ShSgPahfTN+vzjj0Tbu1bLz8SpIfJqSptniMBC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mXTbB8PYCDfw7rUmiizYy2cAX0z+qZaeZJsazMnRvXZ9FwXV5AKF17NDA5UixtpvM
 rFx0l761xtMiTXeF7qCmVP/pVB19yqJyBt20TArW5R5NKHBN1OOFxVsGxbjE5h8w3s
 HpcIbmSjjWyvxECordEA6eBxaePfpAYEZ6xYvU5iwGjnMZ/4JyOsCFKwbi0YXG2O23
 kaRytLPbedyrfi6KFddNQuJZTRDn1Uj0S3mfSIRXzMEIDVtS9cjNIprAvCkjhBsqvu
 BtUgOUP6W6jU75YcosVm7+ji20cYXSHGNwG1J2J4Nl2pxjWURn15y8PPO8C0+lYv2e
 nFJWp0geDQZpA==
Date: Mon, 16 Dec 2024 11:19:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Document Multi-Inno
 Technology MI1010Z1T-1CP11 panel
Message-ID: <ye6qeanenauh7hifouv4x7azgmf7anko5amy63qxemvaswws6e@trnq4dgbjdjt>
References: <20241212122701.25305-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212122701.25305-1-marex@denx.de>
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

On Thu, Dec 12, 2024 at 01:26:28PM +0100, Marek Vasut wrote:
> Add Multi-Inno Technology MI1010Z1T-1CP11 10.1" 1024x600 LVDS panel
> compatible string.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

