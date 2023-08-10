Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF02778298
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 23:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF3B10E60A;
	Thu, 10 Aug 2023 21:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B1910E60A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 21:18:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA67966910;
 Thu, 10 Aug 2023 21:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB97C433C8;
 Thu, 10 Aug 2023 21:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691702314;
 bh=bXauksbrzRIAzsLWLan2wzaQd8ocmpjaKkxYLxARuKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JiWj/ngmviRpQtR+W6p+RCEXQJEVgJ1iAUpjp8ZcBZ4jBwswvDVQxyHaVq61/c3I9
 m4pewl7IH5Wh8VqMrCMSHTM1BS0ZNz9V/vNdvvnbRuOA3C9gmGisqkNezVYgF6XfBm
 UUSy33iHtqmnSHH3qgnMgn/xTc24+O0kpheMy1Ji3E8Yp5QXw4WH4pUhVAFaDgW9lT
 Gs86IbMYzbWED1UxFw3QZrdIFnTz8/aCEDpxLPplYVJLHd5/ZawcdKOufQG/YJ4Oqc
 aiiWIF84Ci5sfBfZCvl0sTpnZLNEPVltT3K97T6oilWhv8MFIHgbXqufsi5B+UAwO5
 z8MML+6p1FYkg==
Received: (nullmailer pid 1205465 invoked by uid 1000);
 Thu, 10 Aug 2023 21:18:32 -0000
Date: Thu, 10 Aug 2023 15:18:32 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add ShenZhen New
 Display Co.
Message-ID: <169170231172.1205407.8593190423899846567.robh@kernel.org>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:41:14 +0200, Luca Ceresoli wrote:
> ShenZhen New Display Co., Limited is the manufacturer of the
> NDS040480800-V3 LCD panel according the datasheet.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2: none
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

