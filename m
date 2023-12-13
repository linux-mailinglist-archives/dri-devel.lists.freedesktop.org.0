Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E681160B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B82910E1B7;
	Wed, 13 Dec 2023 15:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9010E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 76028B81DD4;
 Wed, 13 Dec 2023 15:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5BFC433C8;
 Wed, 13 Dec 2023 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480939;
 bh=2nnBgauLOOLnaW05Yd3Emao9XmiuRTCFgme44VmuzWo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gOzIP+VPvQvIGegjVD3/wczHHGb3aROvFrp+HVeG7od/i8kI1VHAdiNUB4vTy0Brr
 yaqHnlCVPjwHzuSkrf1pOXcW0lLumDmEwqj5/y4ieD4rkhzJwCN4VdAvcgeEBUJUaS
 SaaZRiMAFhXutxSCbSCBN1fALoJqeeSAqzEaWJLoct6bLnCHJYIpr5pdfgg5wol7++
 W00fnAg52sW8FAb1FTkMXM0BEakZLq4/AV7YHyRzJy3B+HHI4Kbt3n1HOsmi1D1qGn
 EXVEfTolPAcCc8ZRgEPCN1IZd4+PqFMEySSjP9IB3sVVW/6QTocDjIuHZw/aLEtehB
 IoIJXj8Z3vYfQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231213043925.13852-1-rdunlap@infradead.org>
References: <20231213043925.13852-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/fourcc: fix spelling/typos
Message-Id: <170248093691.191897.10474033502006567170.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:16 +0100
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

On Tue, 12 Dec 2023 20:39:25 -0800, Randy Dunlap wrote:
> Correct spelling mistakes that were identified by codespell.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

