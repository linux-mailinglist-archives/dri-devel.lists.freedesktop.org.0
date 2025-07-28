Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2208B13961
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67E310E4D6;
	Mon, 28 Jul 2025 10:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T2+LKGAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF8B10E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B1EA601CE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2264C4CEE7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753700258;
 bh=h8Yn2VRU2bU579L37/02UT1zZ/MlYIwnqlafwAnXDtA=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=T2+LKGAJ+9HYNILpVbnrQEbJ+Prg/6b6oJup7BjndzivwsF+AuSGTeHeKV95/sUcq
 Pn7cpq+/+9BAOmPKc/Z28/Jtwd/AB9/q8CZL6+Nf2/Z/35t/77U4gW5ymC+q96AlFQ
 eiyEqPYqgVmeD6K0G1/KN7cO33quUEueWbS2AWeMLsluDD53YefRE1H7Nq3QKeDkaq
 Zyro4CBI1zxEdmEOmmj4yWMpyyvJzycse7zM+AdwksbRz1rKAT/Eq5VGnRgLUuVq27
 SNRpvO3oYLA0WKiCYhnEcs+OWrUlOeREoAMgAhqihZJKs+zRUd3ZNEDTqvhl+yIz/7
 iuJBlN7P26Xaw==
Message-ID: <bec5c9a9-bbb8-4dd2-b1a7-36a50eea8d13@kernel.org>
Date: Mon, 28 Jul 2025 12:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/1] gpu: drm: display: drm_dp_cec: update Hans' email
 address
To: dri-devel@lists.freedesktop.org
References: <cover.1753700097.git.hverkuil+cisco@kernel.org>
 <948b67aa923d0887b538912357c218c71417dac6.1753700097.git.hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <948b67aa923d0887b538912357c218c71417dac6.1753700097.git.hverkuil+cisco@kernel.org>
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

On 28/07/2025 12:54, Hans Verkuil wrote:
> From: Hans Verkuil <hverkuil@kernel.org>
> 
> Replace hverkuil@xs4all.nl by hverkuil@kernel.org.
> 
> Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Apologies, ignore this patch. It was a test and I forgot about the Cc above.

Regards,

	Hans

> ---
>  drivers/gpu/drm/display/drm_dp_cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
> index ed31471bd0e2..d0dcc9b4b92d 100644
> --- a/drivers/gpu/drm/display/drm_dp_cec.c
> +++ b/drivers/gpu/drm/display/drm_dp_cec.c
> @@ -41,7 +41,7 @@
>   *
>   * https://hverkuil.home.xs4all.nl/cec-status.txt
>   *
> - * Please mail me (hverkuil@xs4all.nl) if you find an adapter that works
> + * Please mail me (hverkuil@kernel.org) if you find an adapter that works
>   * and is not yet listed there.
>   *
>   * Note that the current implementation does not support CEC over an MST hub.

