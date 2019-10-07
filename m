Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFDCDBB3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 08:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048776E454;
	Mon,  7 Oct 2019 06:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 959446E455
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 05:59:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 929A472162; Mon,  7 Oct 2019 05:59:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Mon, 07 Oct 2019 05:59:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.hirte@datenkhaos.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-TSXfuy5iyV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1205330839=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1205330839==
Content-Type: multipart/alternative; boundary="15704279982.E438.10910"
Content-Transfer-Encoding: 7bit


--15704279982.E438.10910
Date: Mon, 7 Oct 2019 05:59:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #28 from Johannes Hirte <johannes.hirte@datenkhaos.de> ---
(In reply to John Smith from comment #22)
> (In reply to Johannes Hirte from comment #21)
> > Any possibility to test with 5.3 kernel? It seems it's fixed but not
> > backported.
>=20
> If I'm understanding it correctly, backported means it already should be =
in
> 5.4, no?

You're right, I've read it wrong.=20

From the reports, it seems to be compositor related. For me, kwin with Open=
GL
3.1 backend works fine. xfwm4 seems to trigger the bug, maybe other composi=
tors
too.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704279982.E438.10910
Date: Mon, 7 Oct 2019 05:59:58 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
johannes.hirte&#64;datenkhaos.de" title=3D"Johannes Hirte &lt;johannes.hirt=
e&#64;datenkhaos.de&gt;"> <span class=3D"fn">Johannes Hirte</span></a>
</span></b>
        <pre>(In reply to John Smith from <a href=3D"show_bug.cgi?id=3D1096=
28#c22">comment #22</a>)
<span class=3D"quote">&gt; (In reply to Johannes Hirte from <a href=3D"show=
_bug.cgi?id=3D109628#c21">comment #21</a>)
&gt; &gt; Any possibility to test with 5.3 kernel? It seems it's fixed but =
not
&gt; &gt; backported.
&gt;=20
&gt; If I'm understanding it correctly, backported means it already should =
be in
&gt; 5.4, no?</span >

You're right, I've read it wrong.=20

From the reports, it seems to be compositor related. For me, kwin with Open=
GL
3.1 backend works fine. xfwm4 seems to trigger the bug, maybe other composi=
tors
too.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704279982.E438.10910--

--===============1205330839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1205330839==--
