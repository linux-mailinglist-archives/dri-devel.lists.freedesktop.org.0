Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A3AE78F5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 09:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2687910E209;
	Wed, 25 Jun 2025 07:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZO9z4op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432E810E209
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81C36A51558;
 Wed, 25 Jun 2025 07:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95561C4CEEA;
 Wed, 25 Jun 2025 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750837454;
 bh=7aqupwu0BATzVc+nx6+3/6tOlY1gqfjTFE3qutqlfDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZO9z4opj6eOQVmq+swx/ur6Fy1A9sq/e71+AXmB2Yx3iGieCiZS4Fb4TtWRS0Ycz
 pMTeYdF6ykCv8pqSH3yqdqb4YcvULMNpyytP4yoXZtWnB3D0KqPZ/Q2Oatn/KYSPkZ
 70dP927aC3lz7qsBSOr+gD7OfxCKQbwy1Atz9JUhIWZ8JtfD1b0HnphWvRnpfQYIKF
 QSBoQ9vnf+GpSVS60uhR5+fMifKYCUKUFwE0DY/HAGCEsZhZeGpcJA2vN2bpe1JvP5
 pBN/hUYxrHHHd5TWknZC+dC3BMBWaCyd2qBovC9d7BPTgwdacRz1/9lwE2LIp45Up0
 Dbxa3iaIcrhFw==
Date: Wed, 25 Jun 2025 09:44:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <j2nni4oyoochjgw5w7vodxnn562vff2krkesta6zzgqs5ihvcx@5up7ga7k4gdl>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-2-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622133820.18369-2-quic_lxu5@quicinc.com>
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

On Sun, Jun 22, 2025 at 07:08:18PM +0530, Ling Xu wrote:
> Add "gdsp" as the new supported label for GDSP fastrpc domain.

Neither this commit, nor second nor third explain what is GDSP...

Best regards,
Krzysztof

