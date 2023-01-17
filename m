Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCEE66D95C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 10:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556DF10E528;
	Tue, 17 Jan 2023 09:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FA10E527
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 09:11:11 +0000 (UTC)
Date: Tue, 17 Jan 2023 09:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1673946668; x=1674205868;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=w2iWydoXk8RHqXgW83JFpaIGSpe5l3Y2yeyuaKzWF/vPNEOIqRVxNR6QuwRmyJP/p
 5WOJV2yhDroi1EHes70rVxbpLabma5Yt0KikWA3ri9aGoiC8msgu8eHsJiYLFH+NMQ
 GOsUgsQOWkIyL8ayzjlp/r5IIxBit91tIYCrZpr16Eb46mKbEB7bdn4Gi0t6w9VNhR
 c0qwGXzGOn7/S4WYu6VRWFU1ORJYAIIkQEta5G03/c9rD3dqAZ3JzlbAOIH171rOkp
 nOr0ycLCLjkAPWx+tRvuxMQVNMhIl935j17chy6xVtP+mqAx8Ivx3b0aX5d2dP1Vd3
 AvEzBbCnIczxA==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: fix a kernel-doc bad line warning
Message-ID: <nXsYJJqxCoslSZBdoE_PLzJjM20VzHL3MT7a2dyQ35XrgS590xyt14v6IIGpK4NQ1nQSBF9UmPzvM33zPJhLc3qMndm_zLcLIBBi7zjuTwA=@emersion.fr>
In-Reply-To: <20230117070224.30751-1-rdunlap@infradead.org>
References: <20230117070224.30751-1-rdunlap@infradead.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
