Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709D2E0ACE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4D6E3C4;
	Tue, 22 Dec 2020 13:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38096E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:35:26 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0D1D92000F;
 Tue, 22 Dec 2020 13:35:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/5] drm/doc: misc documentation improvements
Date: Tue, 22 Dec 2020 14:35:19 +0100
Message-Id: <20201222133524.160842-1-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hm, a git rebase was missing some of my changes for v3. Sorry about that.

Simon Ser (5):
  drm/doc: fix drm_plane_type docs
  drm/doc: document the type plane property
  drm/doc: re-format drm.h file comment
  drm/doc: demote old doc-comments in drm.h
  drm/doc: render drm.h uapi docs

 Documentation/gpu/drm-uapi.rst |  3 ++
 drivers/gpu/drm/drm_plane.c    | 58 +++++++++++++++++++--
 include/drm/drm_plane.h        | 21 +++++---
 include/uapi/drm/drm.h         | 93 +++++++++++++++++-----------------
 4 files changed, 116 insertions(+), 59 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
