Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09A617E6F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5E110E5ED;
	Thu,  3 Nov 2022 13:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0D010E5ED
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:53:22 +0000 (UTC)
Date: Thu, 03 Nov 2022 13:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1667483599; x=1667742799;
 bh=BhsA1aKlglGjpRdMu2peVecDmERAuTyLLhI53Hw2hvM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=S+BbW5c2KHfqm7NbYZhXqErNNnPBoVV3rkPL/Jcl2xbWldG9o7y47J0CO2mpCtwki
 EmAM6E0pTK9k43uBBrUiOeeTkxx7RJrwjWNxiM63XWEBGmTcXCkhh0geqnxlzeh/w0
 LgSbPl6DQoJlvrmW/hrhQaidW4dFggWXFPpQLcrsY3d6HAStBF9RAxbirfYs3H1L4X
 pZKO4E3YqAd7uOrOnZaFtPt59SejFwDDPASafX+dLry8Sh0fpcbe0d4gSfUBy6Mi92
 4HVJU+lAGvjVdZkYcpt+wPEUgoX5z7UkEzqtyirLiRTL8wq62qOwrJJufKsNP8hjJA
 EkxCKPKri7HSQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/7] drm/atomic: log
 drm_atomic_replace_property_blob_from_id() errors
Message-ID: <ubY43ItyySA6aagyF6bYmc5i4iSfgGzT2sDHKhWyDDcM6H6lgc6h3Hj76nmgGkb3H1MM_df761QqKx0r62I_M3FDF_mX702PY79xNE8C7ak=@emersion.fr>
In-Reply-To: <20221019143736.267324-1-contact@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping
