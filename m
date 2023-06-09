Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6CA72966F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736F810E678;
	Fri,  9 Jun 2023 10:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8516A10E678
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 10:12:09 +0000 (UTC)
Date: Fri, 09 Jun 2023 10:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686305526; x=1686564726;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Z8KAJyXpaTjqlrocmyKy6x9aI9Hp2RmjG+2bALz/4DRXehj7XFrjW/yRDU3Dp+qfO
 DqoO/Pm8C11yi1akcmKC3tfSNrHiLjZrCpsLKkQry/WnA2uem4gLUbncQ5lAynXA3J
 AGcRpH3VpZcVSmaY23/BtD7eq5T9GU2iHwXA8lO2pxCnpTGnzBqUhRexAhCEvvTfl9
 z3tHWcugCBoIJp4l1+Ok4Fdg4PB0gm2dfcQ0Ew3Btdf4l/ARtDrbpPg23IjkO+2cO9
 GlnAkbXpmDLcULBxsLW9r1wmFi+eZ3osJvJabskWIlkqBjUnKL153TYBzHSuHJQl+n
 H30tTIIcIEM0w==
To: Colin Ian King <colin.i.king@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH][next] drm/connector: Fix spelling mistake "provded" ->
 "provided"
Message-ID: <tUFXNKt-8oZgTGwGtUnsKtf6pxPDd7KpJWwmrFDemhWU5ZrxXrY210L7paHIPrQot5IEZuX5X57vkDIANUyz56RsHLZpQJeILmX-6h4GG3c=@emersion.fr>
In-Reply-To: <20230609081213.1222580-1-colin.i.king@gmail.com>
References: <20230609081213.1222580-1-colin.i.king@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
