Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF8ACDC80
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FB310E65B;
	Wed,  4 Jun 2025 11:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l0bi89OL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C8910E5B4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02E3AA504A5;
 Wed,  4 Jun 2025 11:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C59C4CEEF;
 Wed,  4 Jun 2025 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749036548;
 bh=zJyMRFBEczTLqz8z8FYq4UOoOGUJIc8c6r7VF0d1i8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l0bi89OL8Exj695NP7nJFY4YitSjZMolAkXqFvpYBPq0JRcaRCzi++FFL/oj/Rnn0
 T3xn+jaYPQFMDMUQTKDPpxcRKjOW6lTInXTr8/RDSWAUepWhIOwML4SrcDQn8v1hoI
 FBPsiaabO0/9OSHKxqWbj6elSM6EcntC6qtD7aOoInVeRSis5qrAHJL7UDm3OwgMjW
 a0DVaDgOTb05lnnbyEKrnyWbXrT2EjhE0d3avn7iYCYMHWmxbHkXfkKFgJdhTlt7dT
 U6TEsTr+JI27Uj9M7KiCK/SBzOAqhvY7ssDJSScy2HUdNDa0jjjeq4ehtfcgZNG0rt
 BDmJXwaVo40YA==
Date: Wed, 4 Jun 2025 13:29:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, sebastian.reichel@collabora.com, heiko@sntech.de, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, 
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add prefix for Huiling
Message-ID: <20250604-prudent-copperhead-of-finesse-e5b41c@kuoka>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603193930.323607-2-macroalpha82@gmail.com>
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

On Tue, Jun 03, 2025 at 02:39:27PM GMT, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Shenzhen Huiling Information Technology Co. Ltd. specializes in the
> research and manufacturing of display and touch screens for industrial
> usage. https://en.szhuiling.com/
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

