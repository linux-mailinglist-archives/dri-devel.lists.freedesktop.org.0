Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A06FF483
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 18:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023F6E1E8;
	Sat, 16 Nov 2019 17:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 198106E1B5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 17:53:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 15F93720E2; Sat, 16 Nov 2019 17:53:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 16 Nov 2019 17:53:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: venemo@msn.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-Hss5hkuN2B@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0023093105=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0023093105==
Content-Type: multipart/alternative; boundary="15739267810.aE3c6dd29.322"
Content-Transfer-Encoding: 7bit


--15739267810.aE3c6dd29.322
Date: Sat, 16 Nov 2019 17:53:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #234 from Timur Krist=C3=B3f <venemo@msn.com> ---
(In reply to John H from comment #227)
> However, I have hard freezes when playing games. A
> specific one I can reproduce EVERY. SINGLE. TIME. was when playing Unreal
> Tournament 3 via Steam proton.

Sounds like the same, or similar issue as this one:
https://gitlab.freedesktop.org/mesa/mesa/issues/868

In that case it was caused by an LLVM bug that has been fixed in LLVM 10 fo=
r a
while but haven't made it into LLVM 9 yet.
If you use mesa 19.3 can you try if the same issue occours with ACO?

(In reply to John Smith from comment #225)
> Is this seriously what AMD calls "support"? No offense but this is
> ridiculous, this card has been out for four months and it still can't even
> browse firefox reliably, even after these "workarounds" and "patches".=20

I can symphatize with your frustration, but I don't think this attitude is
helpful. Pierre-Eric and Alex are doing their best to solve this problem.
Insulting each other in the bugzilla is not constructive and won't bring us
closer to the solution.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739267810.aE3c6dd29.322
Date: Sat, 16 Nov 2019 17:53:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c234">Comm=
ent # 234</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
venemo&#64;msn.com" title=3D"Timur Krist=C3=B3f &lt;venemo&#64;msn.com&gt;"=
> <span class=3D"fn">Timur Krist=C3=B3f</span></a>
</span></b>
        <pre>(In reply to John H from <a href=3D"show_bug.cgi?id=3D111481#c=
227">comment #227</a>)
<span class=3D"quote">&gt; However, I have hard freezes when playing games.=
 A
&gt; specific one I can reproduce EVERY. SINGLE. TIME. was when playing Unr=
eal
&gt; Tournament 3 via Steam proton.</span >

Sounds like the same, or similar issue as this one:
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/issues/868">https://git=
lab.freedesktop.org/mesa/mesa/issues/868</a>

In that case it was caused by an LLVM bug that has been fixed in LLVM 10 fo=
r a
while but haven't made it into LLVM 9 yet.
If you use mesa 19.3 can you try if the same issue occours with ACO?

(In reply to John Smith from <a href=3D"show_bug.cgi?id=3D111481#c225">comm=
ent #225</a>)
<span class=3D"quote">&gt; Is this seriously what AMD calls &quot;support&q=
uot;? No offense but this is
&gt; ridiculous, this card has been out for four months and it still can't =
even
&gt; browse firefox reliably, even after these &quot;workarounds&quot; and =
&quot;patches&quot;. </span >

I can symphatize with your frustration, but I don't think this attitude is
helpful. Pierre-Eric and Alex are doing their best to solve this problem.
Insulting each other in the bugzilla is not constructive and won't bring us
closer to the solution.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739267810.aE3c6dd29.322--

--===============0023093105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0023093105==--
