Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A618D61F990
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1905510E499;
	Mon,  7 Nov 2022 16:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD28710E499
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:26:07 +0000 (UTC)
Date: Mon, 07 Nov 2022 16:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1667838365; x=1668097565;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=od/X2Oj4LpeESTxc29pBgr5kzNZkWetVxwfBSN8N0vpHVQf1IWj2s3REv/zCXM211
 ZQeIasq7nVw7JQbsBrsDsBVErGhBeNy7xsYHi5zqNKkRlA/3M8QCDcJVBp7JxRtkOD
 4s/JytCB+Qk4JJrsaev13Nbq+UVTy82CDM+n/4hBDxkhojMYN5BFC3mXg35JTEQl1d
 Wb1yXnoEvVvoldQQpddJhX5EBiOpyM1+L3ZVCTc7Q8yf4UMgEg63VM+NVIygisSeuy
 ls9tOrXrkfd/cF/lhP/H+2De8rR29CWEUdNIK/k9cvxR2wlPtDt/+F0bdJdZXa4yhr
 w5Bi5nowqIgtQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Nanote
 UMPC-01
Message-ID: <26aEQcP_ViYtKVyckwJ8dtLn-k76hwJDpZtmNZYl_7V6FVlzfPYclnxUsgq2m5FgfxVzqoR4u3CO0nBdqBgql71KvqJrj74f8fr4ba4Ojmk=@emersion.fr>
In-Reply-To: <20220919133258.711639-1-hdegoede@redhat.com>
References: <20220919133258.711639-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
