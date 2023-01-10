Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F18663F7E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2710E5A6;
	Tue, 10 Jan 2023 11:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47910E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:49:34 +0000 (UTC)
Date: Tue, 10 Jan 2023 11:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673351372; x=1673610572;
 bh=G+xykdRb1Ba6p/DeQ0KJEfvcYfrSs1EcsorORQzBThY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DS70BpXj98H7qtAXJMa2KeCHIdvvTgponGsuAwaw6mi8JrAw5x3PxwblY8CA+Rog6
 kpCEKtNOS7xL7k58aN2ERWW0uy3oGdsBoxkVyIS6822Ors+JfDpUpeNxfh3JER3m+B
 nt+Wo1laEUPnKVFgtoJQj/3FY5JhasSI8CoWXjcA7sx+vbREpsy1mgyt7GWNaAzFvu
 GSQ/Dv71KksPhEFoWrSuXkdqv8VX9W4x/IPEiygO9yknC2PQnEvTTi9ncRRilE2qJV
 9EuiIulHoz0DYabPrAHeDqgEOeBv8ZzasEWk/u33y35N9USRZJUfxTB1IGE1hYCs/7
 J6Wq63VxUjRyg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr>
In-Reply-To: <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
References: <20221128133853.355645-1-contact@emersion.fr>
 <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, November 29th, 2022 at 10:56, Christian K=C3=B6nig <christian.k=
oenig@amd.com> wrote:

> Should I also push this?

I can push to drm-misc-next, but is that the suitable repo?
