Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9C93D217
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 13:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BD210E828;
	Fri, 26 Jul 2024 11:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jY0zsxhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4410E09F;
 Fri, 26 Jul 2024 11:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69DA7CE1349;
 Fri, 26 Jul 2024 11:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9772C32782;
 Fri, 26 Jul 2024 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721992794;
 bh=5EX99VlAmyGBICk/5y+ev5w0dqO1k1M1oQo5RWS/vR8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jY0zsxhQPwxuJVf1w+/9Ks8LYDpMKauqwex0+oSaN5DJ6Vxx4tzHn2GHoTqcbr99H
 MIjDZgS1PIKpBUmwvOwQK89nUuoEwDyesihbZcl2BlxdzgNnB3qiv56x3rTyRf1wQh
 YgcL9PYDsL8GE+SyM0klC1w4+xUCipmwaM6RaBupwa3FL13ZMa2NWq96Y3CAx25dyL
 GsAUvgVJgSpxG1/USf0bwP+F8PoUnWsGkBOffFCEZOcB0rX4oQ2+U2Bi6dyN3PCd6l
 iRTXb2KniXl86bFGlJPc8YwuWYZ7ej6X0MuF6vowGI+17YrZQ5Hdo9TQ9mE4bKHXCj
 G80PhhbJsPVQA==
Message-ID: <39a2303c-c89c-4fa3-a2e3-87589d242f4e@kernel.org>
Date: Fri, 26 Jul 2024 13:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Update Konrad Dybcio's email addresses
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 26.07.2024 1:18 PM, Konrad Dybcio wrote:
> Patch 3 should probably go straight to Rob's dt-bindings tree
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> ---
> Konrad Dybcio (3):
>       mailmap: Add an entry for Konrad Dybcio
>       MAINTAINERS: Update Konrad Dybcio's email address
>       dt-bindings: Batch-update Konrad Dybcio's email

Err, please excuse the mismatched From: address.. it is definitely
the same Konrad speaking..

Konrad
