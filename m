Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3105049072D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 12:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F3F10E121;
	Mon, 17 Jan 2022 11:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E6010E121
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642419279;
 bh=ixYk5MD8R5rNfTjSru7HMfOf9ODsYIJqWhVfbGz0ugE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ggDZBvzrdOsJm5kYnP0EB9aiEGGjVtL63MqyEw9eFprRI5FIfCEAIVEtcLTzd+6QH
 LA2StO1NVyt25vQndr0Xbka7BG2kEjPM0gPu4DxwGTHtBen7tSoKHtfiIQp0jk4gJy
 mLzsyzBtpcZR0sj/wdcWi6Ka8Dl4CUqaXOWIgF5o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1nBMDm2N7B-002bDo; Mon, 17
 Jan 2022 12:34:39 +0100
Message-ID: <9814d071-2a01-f452-8bf9-4d216a11186d@gmx.de>
Date: Mon, 17 Jan 2022 12:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:II3Xzz0r0WZUTIWd7usXxmmg5CbCeZdmAmFEb0usWE1FFQrDFCi
 8cniIJJPypYyHz4L0tyMRAAUbdiNQzbQFnQVH5FumOvO4pu9Y8Fg/0IT+tEJqHqSYSJP5Ht
 bU1Y3/MvbxfI/pFHZhS2TmlqOtKtw+1GyK5Pib4ZQU4y/sBwOLJKsuhrgL/CJEMycpfoH6Y
 Qfgoy5K8KMsoBvWq0KM0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vzZXgwMU3l0=:mWqwBzWJBBo/WO6qFlZLXM
 SzWTxmBmRJUZ+a4o4fQ/qaIlTKFg0Ut7RA7umThm1Ac+IF42yRn1TyktCIMRjx4eGA2grT/EA
 vw/oHzIFCy7R3EJJiE5TGWbqQU+lJAuGBsYGzhSOy0rgFvBUVAD7FkqFQ5gdulKME10o6ucE+
 I/j3U4IjK1NGuaZs5RJY57aO6U5YNnJgqgUqP0QyMUiy+GiHF/w7uW3Mp/yHz7sDcXG8bFwCV
 jdsJL7nB0HxqNtDCi4y11ftbQMLEFYqzd8yPb/YWTzYPtuD+54aS2SLYjyGORzTEisajemSlV
 qWx4e4trGLTACup6r2OMAhSxNXDVSG9XZbedppQxuikF8SHxBfWH/CSDp/i8AfH6iIf4fvSGE
 y+6lPeTvOwPlh5v0BVWlYYJ0FEIRtiJ9WEgXUKj/BNFUHIQUeyxu0XfgS/GO8QFgK3Hrx2JPa
 H3QjWMNl/BZoiyV6pPl2Xguva6BilOSrTds66DnfWW57zOxvbsJsNu0lckbM/WiJ5SeS8SJE/
 xK+Dd3wqcIkuPoZYUlvbrUTxCmMLN9yPv+X0uZhrXmTO+ydTTtPx/3blKR64o6vJYZlZUE4i8
 kRNUkDf9v7cjzRsJe663KJ1onvblWoEo+DaF5eleBJzVD+G2GZU4HJbGVTSEA9VPeymSUSi1Y
 /Z+YEWRueHeBPP3LO++03627RkyMc/Sy8IZbrPK7R+ia1Tl8hBcEWx6iXvWomstPBffwNCf/1
 Wlfz6DTbXqqop329G08flltuPOWpKYtBIRGwOMMSbjDcGaaN9Od+czzHZ4RhWZmf4hIzf059L
 NGFRv+3X+nRgTQEzppYv6T7wmTXX1RAdwqCiwlnFt1V+7AUgquwlFo8nHAS7BS/+DPaxhLqUb
 TaiC/0HKVjf6bUlvqCiO6W4Q4X8RXgbdCtBxX+kWvk3Eydd/qXGuGQMpHmbHI4g9CA48MivhY
 P4srW2NhSCPYoBavDeQ+wIeXnRBlv6kL0GKE4Dy8dVL3z4FHhBI7yWsh+2JWreqG07k3oirJK
 ERcDtNy0XCT2ZutQ/v3UiVDN2ikDGi5hsSloR/eBA82oxdmoK+/dPLhcgeDXZKR6yT1NzvPQI
 xxj3cUhtazrwzc=
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 1/17/22 12:16, Thomas Zimmermann wrote:
> Hi
>
> Am 14.01.22 um 19:11 schrieb Helge Deller:
>> The fbdev layer is orphaned, but seems to need some care.
>> So I'd like to step up as new maintainer.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
> First of all, thank you for stepping up to maintain the fbdev
> codebase. It really needs someone actively looking after it.

Thanks.

> And now comes the BUT.
>
> I want to second everything said by Danial and Javier. In addition to
> purely organizational topics (trees, PRs, etc), there are a number of
> inherit problems with fbdev.

I will answer that in the other mail to Daniel shortly...

> * It's 90s technology. Neither does it fit today's userspace, not
> hardware. If you have more than just the most trivial of graphical
> output fbdev isn't for you.

Right.
I'm working and maintaining such hardware.
There is not just x86, there is not just Intel/AMD/nvidia graphics
and for those fbdev is still (and will be) important.

> * There's no new development in fbdev and there are no new drivers.
> Everyone works on DRM, which is better in most regards.

In most regards yes.
So, don't get me wrong.
I fully agree DRM that is the way forward.
But on the way forward we shouldn't try to actively break code for others.

> The consequence is that userspace is slowly loosing the ability to
> use fbdev.
Maybe.

> * A few use-cases for efifb remain, but distributions are actively
> moving away from fbdev. I know that at least openSUSE, Fedora and
> Alpine do this.

Debian is still running on lots of hardware, either which isn't x86 or
which is old hardware.
The distributions you mentioned still need fbdev for machines were DRM isn=
't
available (yet).

> I'd like to hear what your plans are for fbdev?

That's easy:
* To maintain it.
* To keep it working for where DRM can't be used.
* My goal is NOT to work against DRM. That's the future of course.

Helge

>
> Best regards
> Thomas
>
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d0cd537803a..ce47dbc467cc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7583,11 +7583,12 @@ W:=C2=A0=C2=A0=C2=A0 http://floatingpoint.sourc=
eforge.net/emulator/index.html
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 arch/x86/math-emu/
>>
>> =C2=A0 FRAMEBUFFER LAYER
>> -L:=C2=A0=C2=A0=C2=A0 dri-devel@lists.freedesktop.org
>> +M:=C2=A0=C2=A0=C2=A0 Helge Deller <deller@gmx.de>
>> =C2=A0 L:=C2=A0=C2=A0=C2=A0 linux-fbdev@vger.kernel.org
>> -S:=C2=A0=C2=A0=C2=A0 Orphan
>> +L:=C2=A0=C2=A0=C2=A0 dri-devel@lists.freedesktop.org
>> +S:=C2=A0=C2=A0=C2=A0 Maintained
>> =C2=A0 Q:=C2=A0=C2=A0=C2=A0 http://patchwork.kernel.org/project/linux-f=
bdev/list/
>> -T:=C2=A0=C2=A0=C2=A0 git git://anongit.freedesktop.org/drm/drm-misc
>> +T:=C2=A0=C2=A0=C2=A0 git git://git.kernel.org/pub/scm/linux/kernel/git=
/deller/linux-fbdev.git
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 Documentation/fb/
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/video/
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 include/linux/fb.h
>

