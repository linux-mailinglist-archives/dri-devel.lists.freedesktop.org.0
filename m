Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F561EEA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CBB10E11E;
	Mon,  7 Nov 2022 09:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9148510E11E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 09:19:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 222A0B80E81;
 Mon,  7 Nov 2022 09:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2455C433D6;
 Mon,  7 Nov 2022 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667812783;
 bh=6Nx7JDwmY/apf1WMX6YISTNpp3UAtiSL9C8XwycAYTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lO0/lhqbioWDTQ/5vtK84wlT34ZgObkWs9sKdEuTkY8BNneqaclvfW3i3qsuPEXyp
 bMl6PpxFyQU1l8pfYzdAthVgWTQVgd1CUFOuom31C2owGUBUbctk9cmQRQHwv/o6Wj
 +Cdh7jISPD2SWN4GZfCuaoIIvUFrFZ5pVw0un7uhoygpZLLfMx2C75dwYMDpFBQObW
 UMMXML2+UoRUX1Fujk1WhMTrGBlMX45qcOEFuc5IxIvixDO0aBwE3q3J7ZYPVYty9H
 g8ZPR9if40EI8Dx9dZaJhGZQRcMbR2olZ7MejPt72Z9j55X+gOOVnshEJEHU0Ul3kN
 r+LCCU5RQBkpw==
Date: Mon, 7 Nov 2022 09:19:36 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: qcom-wled: Add PMI8950
 compatible
Message-ID: <Y2jNqChLjixM9grL@google.com>
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101161801.1058969-1-luca@z3ntu.xyz>
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
 Kiran Gunda <kgunda@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Nov 2022, Luca Weiss wrote:

> Document the compatible for the wled block found in PMI8950.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since v2:
> * New patch
> 
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
