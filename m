Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF44348D3A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249406EB51;
	Thu, 25 Mar 2021 09:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2C96EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:41:59 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616665317;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mjOUrGvLzSAdMaWBPIf4xwsJldbr0+695vJNm0XNjpUUBDB5bX1EUgR9x4FyVvD2Y
 UUn4rk5cBnsp1wgqb+weS0b3suBnmNHkntbFOe3YGxgHq/fe9yTkm2Uqo/DeXFi3hr
 NmOCZQHT2bF7FpYLFRjiv3yIUjUJ3khtvQNAUn2s8Yu2s2r9DExG23dcX4M7JzyZS9
 aeLbDgUweZ27BAz99TJvqnnnnMQxoWKKP4HMnlU0KkhS2qPFaajeZEQ0dytBO3Ewbq
 BU+arlR7EckBZ2odXffEahhJloF2HSGomejTFomF/6YPZlCtcisogbVnXk2zrWs8uZ
 aQ2pZNVoDuw+Q==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
Message-ID: <oMKA4ZguEsopOJVahmttvIOEUJ2taQGAFuPom_BRvvAhbAQNdgbYwU26xjz8-FH6Mj5hyYA6iGKjhjxG63hDj_Fe3dbI72lz9C3wySfuBAs=@emersion.fr>
In-Reply-To: <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
References: <20210324211041.1354941-1-daniel.vetter@ffwll.ch>
 <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
