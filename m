Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2173436447
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09D6ECAD;
	Thu, 21 Oct 2021 14:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85A6EC8D;
 Thu, 21 Oct 2021 14:28:57 +0000 (UTC)
Date: Thu, 21 Oct 2021 14:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634826535;
 bh=XhCHjy4D/VoaIqOFwU/L+rZZ/vqAoKZ2ejoeJJT2rNA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=u/6sFNgLLWqLY6g3u/dwNUO5iVIWPCFS9/3O5Yw8JSmbXqB8Jcuin/duG+eOt6zpR
 2lvGCzAPY6eHuFRj+TVg6ijlD18fjfNKn6i9TrELbzL1Lda2/2ZRebBqm0dX/ISb9o
 EaaGXs3/1VZ6hrNn2XFwwmAIRlAGmfaD6OEwWaPDoJdJ11HX4TTR+WoHxK1CqPRBnO
 WvdeH1U4+ugW0Ht5Shch8+eF575+JTx9TtpFmM12zSc+qLPkcvbFjaqO/HKyy5aeka
 FqjRtNWepjSvqb6mEHoQDUlxZfRIKYan+/2daWcrJT6+uxD8bVhuX11aje8K5MPqoz
 15QH3WwSJmAQg==
To: Ramalingam C <ramalingam.c@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 CQ Tang <cq.tang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 14/17] uapi/drm/dg2: Format modifier for DG2 unified
 compression and clear color
Message-ID: <0TCwIaJ_y0G_dlblGhM5TI_ssamrIgqkNkEReoQRgtJ74Lo3UFL3Q-1vicXKBwRwgtcEBjCaTIJDZAO53sJhFl8gqPHhwqYa3v4JoUWgZWw=@emersion.fr>
In-Reply-To: <20211021142627.31058-15-ramalingam.c@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-15-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the include/uapi/drm/drm_fourcc.h changes:

Acked-by: Simon Ser <contact@emersion.fr>
