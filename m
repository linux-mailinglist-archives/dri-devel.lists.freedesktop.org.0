Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF03C6097
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84C89D39;
	Mon, 12 Jul 2021 16:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C0E89D39
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:28:30 +0000 (UTC)
Date: Mon, 12 Jul 2021 16:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1626107308;
 bh=PwTNbBtkHFCxR9pENzdq49NmiG0tQNi59EYpZtgSvxE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GsjDLYwWxwMLgi8JeW4Gce7FEsX++Sga1THpMmAo+yh/um952t/tRjaYJNDLo1HkP
 NXb54Q0e2ZY6YNbsnFGibwHiSkw3UNIseTrPiaejZbaCUB4zbgjWFaNT/nnSLgPzwN
 D0LYHXKTJMMsdfVxucEoBblbclG3TMXrbL+X4SzkR4+6iT/BdqgwpUgI71UMImGF+a
 ljgz3vLWQMZOjAam2n5MnHMrNpU8kO2Y91TBnXtseeZZW41+rW37/IVFdCH3cabYcZ
 BDZyzx9HbWx5uVeCu9F6QXoLnCCASY7Djax7XoRC/nG6V/7/TXC1KI+iBYrwMuZHde
 sMsSc0A4LTXwg==
To: Normunds Rieksts <normunds.rieksts@arm.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: Add modifier definitions for Arm Fixed Rate
 Compression
Message-ID: <9tyET_NSA0fwuL-_yTq772TTqD3DY8xGoPlg6LcjyKtfkMNLmmGGG2dnDnJQSVYpLdlllAaOJDwVdFf7GegcyktnGQfcjB-sh9PFfhhMqRY=@emersion.fr>
In-Reply-To: <20210701170709.39922-1-normunds.rieksts@arm.com>
References: <20210701170709.39922-1-normunds.rieksts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, nd@arm.com, Matteo.Franchin@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot for the documentation, I appreciate the effort.
