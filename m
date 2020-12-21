Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B72E0304
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 00:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8759989CF5;
	Mon, 21 Dec 2020 23:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0389CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 23:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A2EA1230FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 23:50:07 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 9D3CF816EB; Mon, 21 Dec 2020 23:50:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Mon, 21 Dec 2020 23:50:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: raidon.logic@auweek.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205675-2300-mbYz59JK0v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205675

wrenrte (raidon.logic@auweek.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |raidon.logic@auweek.net

--- Comment #42 from wrenrte (raidon.logic@auweek.net) ---
https://www.deviantart.com/swrbwaeae/journal/OFFICIAL-FREE-Bengals-vs-Steelers-Live-Stream-864746648
https://www.deviantart.com/swrbwaeae/journal/Reddit-Streams-Bengals-vs-Steelers-live-stream-864747204
https://www.deviantart.com/swrbwaeae/journal/FREE-Bengals-vs-Steelers-Live-Stream-Free-20-864747209
https://www.deviantart.com/swrbwaeae/journal/watch-Bengals-vs-Steelers-Live-Stream-free-2020-864747208
https://www.deviantart.com/swrbwaeae/journal/StreamS-reddit-Bengals-vs-Steelers-Stream-Reddi-864747214
https://www.deviantart.com/swrbwaeae/journal/STrEaMs-reddit-Steelers-vs-Bengals-Live-Strea-864747215
https://www.deviantart.com/swrbwaeae/journal/LIVESTREAM-Steelers-vs-Bengals-Live-Stream-864747217
https://www.deviantart.com/swrbwaeae/journal/Official-LivEStrEaM-Steelers-vs-Bengals-Live-864747218
https://www.deviantart.com/swrbwaeae/journal/Monday-Night-Football-Live-Stream-864747221
https://www.deviantart.com/swrbwaeae/journal/Bengals-vs-Steelers-Monday-Night-Football-Live-Str-864747224
https://www.bkreader.com/events/nfl-reddit-streams-steelers-vs-bengals-live-online-free-game-week-15-tv-coverage-2020-4/
https://www.bkreader.com/events/livestreamofficial-bengals-vs-steelers-live-stream-free/
https://www.bkreader.com/events/official-livestream-bengals-vs-steelers-live-stream-reddit/
https://www.bkreader.com/events/redditstreams-bengals-vs-steelers-live-stream-nfl/
https://www.bkreader.com/events/live-stream-bengals-vs-steelers-live-stream-free/
https://www.bkreader.com/events/watch-steelers-vs-bengals-live-streams-nfl-free-reddit-online-football-game-2020-week-15/
https://www.bkreader.com/events/redditstreams-steelers-vs-bengals-live-stream-free/
https://www.bkreader.com/events/redditstreams-steelers-vs-bengals-live-stream-final/
https://www.bkreader.com/events/monday-night-football-live-stream-free-reddit/
https://mawymyly.medium.com/when-writing-a-react-native-app-using-react-navigation-we-often-run-into-a-particular-problem-a31cef07742c
https://mawymyly.medium.com/it-is-one-of-the-other-popular-methods-of-incorporating-machine-learning-in-apps-mostly-when-you-4470103f4e07
https://mawymyly.medium.com/pale-rider-is-a-fascinating-look-at-life-in-the-midst-of-a-pandemic-that-killed-somewhere-between-a5a658d13987

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
