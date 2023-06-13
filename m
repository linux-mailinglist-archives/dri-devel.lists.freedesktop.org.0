Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0296772EADB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A10010E068;
	Tue, 13 Jun 2023 18:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A38810E068
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:24:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80DE062F60;
 Tue, 13 Jun 2023 18:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB71C433F0;
 Tue, 13 Jun 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686680687;
 bh=Tis3Wz6XKCdZIJB4Yjct2taRoyXb102hF5119qQ8S/8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RlcZZye2W0t/3JAz0Y2xDEOnYKwyX9o97BFurPQ3o9DDnIrszXB8Mndz7T6KCCHQl
 2YZ9JQ9bk+mAEuDn3SRDuPaX8PZMOAr5iuCUpS6C4P9DCdgHlbaS6uTW/40i6ZRBpQ
 PX0CaeaxOdi3XE9pBpCBiFKvv6qSRiGJ30nbuWV1sCTG7tMvzp4gILx8u3oulPw4OL
 BcAIkFM99Q1U6SNdyg/q7CDDAcqnhJn/aHXlGy2S38cJvNANms3mKYWbx8aBrDrdCY
 aGAvEt/YNpkOi0D0GlIAjINaMKntQHwFgvANZ2j5ctRqtNwZzcd8gCnVgIzC2zVk5t
 Ft81XRXZIDaew==
Message-ID: <07f8fc79-cdd8-4d21-5a91-0966abbb0eed@kernel.org>
Date: Tue, 13 Jun 2023 20:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230613144800.52657-3-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, christian.koenig@amd.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2023 16:47, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
> 

I don't see improvements. That's a NAK :(

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

