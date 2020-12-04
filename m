Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31F2CF5BD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 21:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E2D6E216;
	Fri,  4 Dec 2020 20:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDCE6E216
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 20:40:08 +0000 (UTC)
Date: Fri, 04 Dec 2020 20:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607114406;
 bh=VXJ9ibRZTv1m3+U1OW2XwIcFPV1Lic6JzKOtxj4OYVA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UUBoJFw2/tkupDIh9r9ayH1GQuy+seQJvlexHY0WVsin2To841EvahZptfBpzAqxQ
 1nHuLRk+KQf/6RGez4/N+gjQEfepvs3SLZzoegDp1pllYikJ4BnEhJeCRfk0jPEtXP
 5JUzGGZGSqZq+FacZNCpXwyFDfNr0m1n5Iz/J8xtluo4Jcq3N1Zze9/RySKvmWuU/r
 cGKprZBa7zXW8dts6cPD4XQHSxi6pUaoFb96IVigsjjrTtqdDTmJ3QcDpPUamZ9mzL
 KEtNTtN4qfpecbR3IF8zb2F+1Qlnhj7mfwbA5EjKRUaqFLjU4xrfpPeWBE5UwRcp9J
 eIavEUu4IIZfg==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] dma-buf: Fix kerneldoc formatting
Message-ID: <E9O3AOlePc51hOW1ZPxUZVC8EiEAxbNCCm9oaT7qVEiBUO1FrPlYWLpsHgu0bYSPKG3hY6OHKRKOZYZ0XLII82pPsIo2FS3Ekwd4EC9e5Ms=@emersion.fr>
In-Reply-To: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
References: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, December 4th, 2020 at 9:02 PM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> I wanted to look up something and noticed the hyperlink doesn't work.
> While fixing that also noticed a trivial kerneldoc comment typo in the
> same section, fix that too.

Reviewed-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
