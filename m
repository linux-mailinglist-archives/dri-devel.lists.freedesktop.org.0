Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E64AEC729
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 14:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E59310E037;
	Sat, 28 Jun 2025 12:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a9VPwyMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ABE10E037
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 12:36:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3EC85C4BC8;
 Sat, 28 Jun 2025 12:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FF5C4CEEA;
 Sat, 28 Jun 2025 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751114173;
 bh=z/CLDF/X6BDnpeJ5a9vcl4SEOcC44JDymgYIq0TsDc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9VPwyMHg2x9jzkjEN4FgCUZl0H2P6jeYqNAzvqXodQ5x3xMopAZBRsaIUZ79WNjP
 7W1k7B0SQNBrMZCAEGS6ur6Ztu9Ji8AAwx+iiDwqryHl0sRRKt/3bubT/Njpzt1FYe
 c/tVacvhAwKVh4ZeljZkK2mIckiStrbXfIoOb+ncaSZbxpxLluJ9dou23qWyRqbvbT
 iZDWAoqBZJwjbVsXM5vJvNZ6iWKhMvvn8MaUHx3v+UPSD+dpF91s0M7zRXog+7Ge4U
 QpUwGkxP8LI3nyR2gblSFZzNwoJZjMixlzXJ3Q2CjmOMLCqWpq8BLjgJKtharV/5bo
 ljMEH+x+eAjpQ==
Date: Sat, 28 Jun 2025 14:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <20250628-perfect-super-bull-84b312@krzk-bin>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-2-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627103319.2883613-2-quic_lxu5@quicinc.com>
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

On Fri, Jun 27, 2025 at 04:03:16PM +0530, Ling Xu wrote:
> Add "gdsp" as the new supported label for GDSP fastrpc domain.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

NAK, nothing improved. You got comment and you just sent the same.

Best regards,
Krzysztof

