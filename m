Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57122E5945
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 10:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2416EBFB;
	Sat, 26 Oct 2019 08:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07C196EC01
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 08:33:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0476D720E2; Sat, 26 Oct 2019 08:33:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sat, 26 Oct 2019 08:33:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-F6SgPDQxaL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0734250619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0734250619==
Content-Type: multipart/alternative; boundary="15720787851.DD8C0cF68.11935"
Content-Transfer-Encoding: 7bit


--15720787851.DD8C0cF68.11935
Date: Sat, 26 Oct 2019 08:33:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #28 from Robert <freedesktop@postfach.xyz> ---
(In reply to Andrew Sheldon from comment #27)
> A bit of a hacky workaround to 144hz (and multi-monitor issues) on Navi:
>=20

Thanks Andrew for this hack! That's really a joke. This indeed works with my
Navi10 and a 5120x1440@60 Hz resolution. I normally can only use 30 Hz or m=
ax.
39 Hz if I want to stay at 8W in idle mode. If I use >40 Hz idle power
consumption goes up to around 32W. But with your trick I can even use
5120x1440@60 Hz with 8W idle power consumption. :-)

I'm not really into this hardware/driver stuff but I guess this proves that
there is a bug somewhere. Either in the firmware, in the driver or maybe ev=
en
in Mesa or so.

Is someone aware of another place where something like that can be reported=
? I
mean I would really try out everything to help developers nailing this down=
 but
I it doesn't look like that there are any AMD developers around here. Ok, m=
aybe
AMD just don't cares about bugs at all but hope is the last thing that dies,
right? ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720787851.DD8C0cF68.11935
Date: Sat, 26 Oct 2019 08:33:05 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
111482#c27">comment #27</a>)
<span class=3D"quote">&gt; A bit of a hacky workaround to 144hz (and multi-=
monitor issues) on Navi:
&gt; </span >

Thanks Andrew for this hack! That's really a joke. This indeed works with my
Navi10 and a 5120x1440&#64;60 Hz resolution. I normally can only use 30 Hz =
or max.
39 Hz if I want to stay at 8W in idle mode. If I use &gt;40 Hz idle power
consumption goes up to around 32W. But with your trick I can even use
5120x1440&#64;60 Hz with 8W idle power consumption. :-)

I'm not really into this hardware/driver stuff but I guess this proves that
there is a bug somewhere. Either in the firmware, in the driver or maybe ev=
en
in Mesa or so.

Is someone aware of another place where something like that can be reported=
? I
mean I would really try out everything to help developers nailing this down=
 but
I it doesn't look like that there are any AMD developers around here. Ok, m=
aybe
AMD just don't cares about bugs at all but hope is the last thing that dies,
right? ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720787851.DD8C0cF68.11935--

--===============0734250619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0734250619==--
