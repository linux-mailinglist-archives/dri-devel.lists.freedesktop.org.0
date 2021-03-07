Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F43303F1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 19:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638CA6E5CC;
	Sun,  7 Mar 2021 18:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9539D6E5CC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5DBE2650DC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615141858;
 bh=ciJAcgbjhDqFX/g7b56KFdxRi7bCoysLWz6fIJG1jQU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hILbjbQNickjJn/q01MmHvdmj4T6o04qqQSzs4V5twKJzzy/nfX44qbAl7pRFSrW2
 F59TkD5bFNsj1NkMWxNfuoBBJ2cjQGBSgvVekiVxSPBTqgquyHWqmdX5ZfJmIvq1dA
 u/X6EtjLl/yrNhQdv7njbN7Kap6BFclKIbD/LG7Jzo7ethMqwB7o8lLXbtbM3ri5ae
 3VbSxmkeBwLnSZametKS41ArSu8rzUGhIXtA05LRaIheRMMhyC9xlM4z1Qch5QBHJL
 SK/yV5SXBFcF8Mf98lSehVXUO09qNNj6mqcJdmc6bGITEFHR41WSf1ULokXAPw2aEb
 gBFl015vD2Ldg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5A43165349; Sun,  7 Mar 2021 18:30:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Sun, 07 Mar 2021 18:30:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212107-2300-OJH98CTC1x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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

https://bugzilla.kernel.org/show_bug.cgi?id=212107

--- Comment #1 from Martin (martin.tk@gmx.com) ---
Created attachment 295703
  --> https://bugzilla.kernel.org/attachment.cgi?id=295703&action=edit
kernel config

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
