Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC0B4408A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AC510EA81;
	Thu,  4 Sep 2025 15:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cybdKSYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18D910EA81;
 Thu,  4 Sep 2025 15:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89D31448DA;
 Thu,  4 Sep 2025 15:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7D9C4CEF0;
 Thu,  4 Sep 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756999588;
 bh=PSc5DK1B9G+iAjYe0HflYSjg6jgkmR4XOYpbOFtdYUo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=cybdKSYtVxA8b3G46WsjOfw8b98/Wj3ymFs9XAK9lCsTwRklq2550wFfYW0lpAcot
 5M8KmCpkTHhUeacCNX/XocfMua5Sl8nFgeOukC2phqbnSxOjWvmjgMRU2Mtb0pO/lc
 /kApV2wDSBmEmZ8ot670x238hdw8kIhJfbuPbq1z91KzlTWGm8k6TdJ0sWRtglZfx6
 f6EbSem9y4O4db9B+D23j/1cOgyYrWy4/eHg+iI42IZxufsVzRTiYwbTUxkdimw7Hh
 QYfzOQ8DTmk9k+eZVe6iG2TKKCqrjr9ItKjgU9QIBfkBL6xUNBBai3b1gsjfvii1pI
 yxlJkck0LGHJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 17:26:24 +0200
Message-Id: <DCK4DE2L5AM3.37W6EMRHC4RES@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
Cc: <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <acourbot@nvidia.com>,
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Jani Nikula" <jani.nikula@linux.intel.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250901202850.208116-1-dakr@kernel.org>
 <aLlsmNzp_KardLUt@google.com>
 <08632fbd-1984-44ff-a6e1-bd9e39bbea97@kernel.org>
In-Reply-To: <08632fbd-1984-44ff-a6e1-bd9e39bbea97@kernel.org>
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

On Thu Sep 4, 2025 at 1:09 PM CEST, Danilo Krummrich wrote:
> I think we should get the same redirect, so the links in MAINTAINERS are
> consistent with each other.

https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/89
