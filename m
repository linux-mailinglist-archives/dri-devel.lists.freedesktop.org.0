Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211581160E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6802D10E2DA;
	Wed, 13 Dec 2023 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35710E273
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 158AFCE0494;
 Wed, 13 Dec 2023 15:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E278EC433C7;
 Wed, 13 Dec 2023 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480945;
 bh=xspoJSwxW1UbMwSP58MLM5359m7z1pTosbrT1C+cP3M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HlxplLnhojYrI7WYv/IZ/EtJOS7gj/G4Jnx8+kl0+MYLJ3OvMo8GpgfCfueA50pQn
 ppig6FqxXRA+uXdxHfg5wSLtEiL7hZrCm6ixYJqYDmBh6wISmdygLYxyv0Wq0upu+N
 OCkcJgfVQ462ePcQKxtB4lFldzGK2bj9SLbtW+zWOFXti7Be/U/lMs5jUov1LBVf3n
 nJR1RWXMA4hgqILBpIxU4bLfGrg0LbykG2wmv1HVoBxfy6ZTqjVE0ErZs+fCiz1R0U
 gev8R6LA2x0yYoC81eu4hTFyrR2r0YHzi/ziP46dkesidPT06wfgtpL8qskXzSjPl1
 BhDMY5BCgFJsQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231213044107.29214-1-rdunlap@infradead.org>
References: <20231213044107.29214-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/uapi: drm_mode.h: fix spellos and grammar
Message-Id: <170248094289.191897.3638139465605527022.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 20:41:07 -0800, Randy Dunlap wrote:
> Correct spellos reported by codespell.
> Fix some grammar (as 's' to a few words).
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

