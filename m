Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F339AFF8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 03:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F26F557;
	Fri,  4 Jun 2021 01:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A586F557
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 01:43:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A47961402
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622771031;
 bh=g++JA5IX8J4DeEID4mMY2nXaYdTeOQKcglPzZn7nsf4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I4M/yyKY9gJKR+Yt5i3pfn2eFP+QQevL5Je+U5zMlBZU4dXK7taPgCf/ZdGsje21/
 XAX/ODYWixONtcqq8p3y2bkD1O1b76fKiGl5Fjed4J+8SRt8NmGuQ84B1BgnAIIUf9
 a7opIhkIv/ALO2RyMMzEG8smqeyXUxAtHvdQAmXSS9AGLNibHcqGnhoF6/F7WjxPP7
 wQj0bqihbuEmPNsgWh+lNqViFHiCEzVZOjiegO4F8dUuOKIv6pVboMQwpH/i8wE6JF
 i639w3HnVvd43iJ3plH53XtZibnCv5i0IRM2uH3M5rsJ2gmfPZuWBTkRAyY6M18hsx
 MSiniklRLMpmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3BC9D6120C; Fri,  4 Jun 2021 01:43:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] Laptop not waking from sleep
Date: Fri, 04 Jun 2021 01:43:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sujay1844@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213321-2300-lLI2Ytx1Qw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213321-2300@https.bugzilla.kernel.org/>
References: <bug-213321-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

--- Comment #5 from Sujay1844 (sujay1844@protonmail.com) ---
K that guy says, it'll be fixed by 5.14
When will that be released??
I heard that 5.14 will be having support for the new Alder Lake M CPUs from
Intel. So I think, we can expect 5.14 to released right around the time of
release of the processors right??

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
