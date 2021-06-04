Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDFD39BD70
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 18:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BD16F61B;
	Fri,  4 Jun 2021 16:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A2D6F61B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 16:42:54 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3DE0F1F43C5D;
 Fri,  4 Jun 2021 17:42:52 +0100 (BST)
Date: Fri, 4 Jun 2021 12:42:47 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4] drm/panfrost: Add AFBC_FEATURES parameter
Message-ID: <YLpYB0hxhaxBk3tU@maud>
References: <20210604130011.3203-1-alyssa.rosenzweig@collabora.com>
 <66673c76-08e5-7fe5-c1fb-dae6dcb60f9f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66673c76-08e5-7fe5-c1fb-dae6dcb60f9f@arm.com>
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
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Repeated word ;) But I've fixed that up and pushed it to drm-misc-next.

Whoops! Thanks. Next up would be v2 of the cycle counter series, which
means adding timestamp queries to the GL driver so I can test new UABI
for a TIMESTAMP parameter... 
