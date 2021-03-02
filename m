Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7232A99E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F4F6E284;
	Tue,  2 Mar 2021 18:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD586E284
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:46:25 +0000 (UTC)
Date: Tue, 02 Mar 2021 18:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614710783;
 bh=ztuY9el2QQWwGAhmpeg6sh7A6O+EeKdX+sHGkliZsyI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=eQhpv5RTrJfwOYzWi/AqoupfETslczu4vdM9gpRVZu02q3UdR9vAWH/yWfeorANsE
 UUCnrx9ShkGSD/KY+5YQxOAN0oPmPlZpzbQkYwVG4x3xTFi65VFylxFPqoTSnupLhA
 m2j8ruIEz/py7YVUJ93P/RYwKh/6HfhL3tIBPUeDaDJnYU4jWicl1G8abaFqEhLWG3
 ae84eTUzlx5tsAW4P9llycHTxQYbV7hUGGAqkpbRMNkqel3DECqhvgg3GSNyPI0x1Q
 qS1Maf6i5yB+Y94jHfT43oFX0o6BLF9pb1FH34KaWB7KhvSTZu138xGONQEALTjM80
 leUYw5QsjHmug==
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix drm_mode_create_blob comment
Message-ID: <Nf4cFhlWS8f3tTL_MvE_MtW993Krf02M8R5WC-RyZ5fYosyKCej9FqPT8QgDwhCnacxn3nKd_HLWjgi47kOrQiYRXVO361sSskqgtp8FoDk=@emersion.fr>
In-Reply-To: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
References: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good catch!

Reviewed-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
