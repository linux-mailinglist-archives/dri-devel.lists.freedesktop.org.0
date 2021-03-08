Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D083309F3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9408F6E833;
	Mon,  8 Mar 2021 09:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26276E833
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9EF56651BC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615194341;
 bh=DWK1zeVuigHzKbL2/ZJQh2KXvSSOkMJNH56o7t004G0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QX52NMSoPwQa3Co6Ka2PEBcQflcTyYCXIalZRBicuk7m6VnBTH80GmOY6LSRrSXCs
 l4Tdzp1hHW2MHnl+SMP9joI11+JOSXA1ROgqJtv1n8akep2XdAsQPqb/CHKrKNTkyJ
 5dTHYAanY4IcHT1vVgbhxhquMQVKt5vrPtmes6CymxpMxg6duj5ZnRdaElrT0BmtsD
 CE676uE/2CFbAZhmOT9rsvcqVVR4aIzBFy+slBIVPhOyrEVYUi4YdOwpMvFvY8YNB+
 m21Qjp52Vksz6nDymop8VmJ2wT4LI52Aa7ILsGKeqc/V3eYgsCP5yd65N8PLWHCPkI
 fd1gHB2RsiSwA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9B98B65349; Mon,  8 Mar 2021 09:05:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Mon, 08 Mar 2021 09:05:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-212107-2300-cJEOfotH2z@https.bugzilla.kernel.org/>
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

Martin (martin.tk@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |blocking

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
