Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1832782F49
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB4910E291;
	Mon, 21 Aug 2023 17:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0D610E291
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 17:17:52 +0000 (UTC)
Date: Mon, 21 Aug 2023 17:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692638269; x=1692897469;
 bh=w304zg8IsjuQSkXYgEj9Ynhi5iONcnQLhbS5KGpqfcs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=amDyP2tJYZyxu5mazV8+K/7Tr5c2ROAiZaNZv6lEbIpY60wcUdObdh8btpkw7Vsrg
 h5Dad+7xj5y70OiObgdCvinRbyP25uocTeJ3oFH0pP2ugh6sMXlTLvxo1cBCpr5j3s
 E+3qg8/ed69plJp/lyLFyjMx0ldp4pdh356jzG/u+HQaZu8hCE1FRdJiXij1iX/CnW
 yXNoLd4rA++LP+Lsk5S5baScwiF9/jGgpu/q57Q3W8gBoJ8lYVTrz7nPbbUNd1YHMq
 m8FuvruURgOvDNYxqRciwwhF37goOPV30V5/mPq2KaVAlp0HqnwKr5oxTa2pNzso7J
 +bZ7WBrKzGJ2g==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] doc: uapi: Add document describing dma-buf
 semantics
Message-ID: <4AJ9AopBcJbXsJ0YNsIH5xe649US3PNa5gLJMchb1x2MiLEnb_uwqXAAzsWiVM3BhlIJqokKNsIZpVWfNIxcFX4KxAB17NNCgaHX6oKZD8Q=@emersion.fr>
In-Reply-To: <ZONnrvrBzWmuuHVl@phenom.ffwll.local>
References: <20210905122742.86029-1-daniels@collabora.com>
 <20230803154908.105124-4-daniels@collabora.com>
 <ZONnrvrBzWmuuHVl@phenom.ffwll.local>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next with minor edits. Thanks!
