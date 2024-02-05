Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DB84A27F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 19:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA081125B8;
	Mon,  5 Feb 2024 18:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mGewp0Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447261125B8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 18:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96BDBCE10AF;
 Mon,  5 Feb 2024 18:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C44C433C7;
 Mon,  5 Feb 2024 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707158260;
 bh=mONJaCocgFll7dK2bAjGsN0zGIKBuFLQytcR0mc/a/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGewp0MhWFG/66z3xwB+S/34Qq9S2MiJi1BkS37FJbm85iC60HIXRRnuSjqc9ZMwo
 kRWe6qo7m7RnMI1csdjifIdVZuT+b7H3L22TC/aUPhKrUde18ww4umrUtf3u9s351q
 xFZiVXBFxFdIfsPe3+hN0NX0YMDQecU0OIB2SMyvSfGXgYHXro8dSDsU3z25XI0pV8
 2awgBnQ43Xio9v3oMATOquzvu4jCWpGalSTSV6DVdsGe6Yani8mrqUDr4FXPbVIZ3R
 bLBseD7JvclrJ4xU+3i5ZlKUAdcPNs5XIQQfCYkVIDw64YlXhwh0FfpzW6b4YXYvR+
 UF6mV/VS/NFGw==
Date: Mon, 5 Feb 2024 18:37:10 +0000
From: Rob Herring <robh@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_kgunda@quicinc.com, conor+dt@kernel.org, pavel@ucw.cz,
 linux-kernel@vger.kernel.org, lee@kernel.org, jingoohan1@gmail.com,
 andersson@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.thompson@linaro.org, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: qcom-wled: Fix bouncing email
 addresses
Message-ID: <170715822956.3957218.3028147322546724367.robh@kernel.org>
References: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
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


On Fri, 02 Feb 2024 11:01:51 -0700, Jeffrey Hugo wrote:
> Bjorn is no longer at Linaro.  Update his email address to @kernel to
> match the .mailmap entry.
> 
> The servers for @codeaurora are long retired and messages sent there
> will bounce.  Update Kiran's email address to match the .mailmap entry.
> 
> This will help anyone that is looking to reach out about this binding
> and is not using .mailmap to pre-process their message.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

