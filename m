Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD860AA0C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680D110E700;
	Mon, 24 Oct 2022 13:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAA210E700
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:27:59 +0000 (UTC)
Date: Mon, 24 Oct 2022 13:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666618076; x=1666877276;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RrKx0ruxHRJcLCtm+CSNShQm6u3rDTD6xov+cxZPXsajzKiUqiiQGr6JeV3pyRDem
 V3byiWA5/AdYuqlxpboIGy1Aa+Z1O0pOzuy1lgXhYgvOyfdzVnBs41+Q5pn7VLDaPD
 UP/BI9BFabn79mo+7UM3f2qnhuvBOzCbgWhBwb20cL8NYuXSBBP+dWotH4I2jZugve
 F4c9gXDs2QblmnCQSHu0Bil53nsPoERTezmANZ5QAzsA6DGwTwONGWqCTBwRnuK+hB
 ZfOipttLXLiH+OTgR2XXXteNyGkdTtlan+5QXmsc5ag8AekKbramZvN5xWPIw16obN
 rJRf88OleU8SQ==
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 15/16] drm/edid: add [CONNECTOR:%d:%s] to debug logging
Message-ID: <6U_Z5zft-VPLFt24BznLzk9ykK2iHlgLRoMRlosOnPrTBc4k6oUkiaJ6i7ZnV3d4nTMqC8hvE4XiqWpRFFyu_oYxR32h5InKMXFToBH1M8c=@emersion.fr>
In-Reply-To: <5884410682bcbc032de4d3af8562c0b271edaa7f.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
 <5884410682bcbc032de4d3af8562c0b271edaa7f.1666614699.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
