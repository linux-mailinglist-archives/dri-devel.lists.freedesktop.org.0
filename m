Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6466FF7FB
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0B910E55A;
	Thu, 11 May 2023 17:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E30010E55A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1683824541; i=deller@gmx.de;
 bh=TUfys7E+944TFOkISLZBtPQGBgxCF4KtXqESXjvmNFU=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=scv9qxT93PJ7A0UpCn69G+Ly5nTi+CXfVcQmXYY0h5U3YKxRkMjuKYktk2on7nOFP
 +AXaTie+FVz84ad9703BT/WeO4aZ7ptb8tnaiPfzz6ORJatrz384WE4XZ8i9GYVhna
 7KmGx8EJWaX1F5XLWgxdLVx7/8Nv5MzpRCysPIfOrdmu9U/LbeEaZxifvRcrDJL3fS
 tL8aoUk5gGBorCdu0HZi7DBndQn+2pRPNZBWktrMw3KCcIZEMSqDrxjeC3V6adWcZu
 etqXIWGauT8+6v/BDBVW/JNiEzv+ZuzNug/MObZqzswP6TaulVmOafXNvyFot1jhf6
 L9qea8qKFiFcA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJZO-1qRW5D0kr8-00fRyc; Thu, 11
 May 2023 19:02:21 +0200
Message-ID: <1c7ca6d3-76d7-047b-42ac-716e12946f90@gmx.de>
Date: Thu, 11 May 2023 19:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <15330273260@189.cn>, geert@linux-m68k.org, javierm@redhat.com,
 daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, davem@davemloft.net, arnd@arndb.de, sam@ravnborg.org
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn>
 <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
 <e7bd021c-1a6b-6e47-143a-36ae2fd2fe6b@suse.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
In-Reply-To: <e7bd021c-1a6b-6e47-143a-36ae2fd2fe6b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ufxNy/weZGscP6z1+yJxtdDriOq+3MhqVBYT0w/Jb/4wi8A99Ir
 q3ByFzMRRO4dUqy7hFc+cC6yNkkK2QSqIE54t5POprgelcLfG2ncw6s4alEeJ111FqnqJFa
 8Kp05TDsMboSk///SW2zrtsgTJUrfeLaADKzc6qnZG/Mlam9qihDJzKya1HMoK80D71UubL
 wAcLsIQy/lrxpKfcj/x1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1SaGdAIIpdA=;9AItiyXmKn/Gp7RMlGxwmCRodmr
 CWgfSrtW37wCM0eDyOgjgDthyt7iwvZxUQNOKI/GSiLUf5QrDOLS3fBoliHuMG2JxPPo3p6zW
 ys7XBwtkfXF6888crwuYFTFYt6DOu8MUXAPTy5QpV1zcCkbORuigAI4JMNScZW9U4R6zwl608
 lDCYZHTHDaoX1sFBFD/F7hSovTMkxooObtEJe3lLBtrcj02z+3iC9IaPTZp1Dk+u0NTRLhOc2
 p3Ni45n755W/QPjVeW64D5nwYN+WN0c1NM4Q0E/Zy0inYF4QmTAnINJ42+nqRIXzOp4CDefOD
 TahZjko9NbIqPwZDlv2ca65IJISU4ZXxyl0CwIfRWK3PrPROxY5R4Qp28iMuzuMl2GEZrdS8n
 gxXGsBtGQhWh6PPcbDeZ6EEzWeoZDZOdAXsNpXnd1lNQpvUyx4Yed/88XM/rafMboYdnaJmBY
 orb7xp1ZfLXqbaGCUzGh02pxQ/oBKek13pI6o6sB4sZ/ZnO/43dbfdpvjILnA6kV6O0V1Jhx/
 YofcmeYIg9H1KJgoIkTdN1KELUR9kzilR4xETfVWMdC8dkXeqUh1AGaOqag3iU97brNv/ilLD
 n2NltCLggIAu4psorNUxCx705HkK2uFfOWi6B3r4RbX5V4/D0CMzUIpSEwd6oB7ORk+5BY8qN
 e2LFmWrtkGd55nGb+MBbTFccLE6jNdNW/qAolaxEYq21PiSA+WwkPnW3Toelu0Y2EjDlaO/mD
 VB2IIkHuaI15Ctzb5wVa613FEyt2c6/6K9hRfXtRGn8O5pItAxtb4okfEUTgdd+jMOxNy4zAb
 UoaCQv8l1eBXdWgQwQ0m1Z3zIDXeLrJODqLk2XTzGJxg+WyWQTzHJtHIVuSSxfkyhT2wdwEBA
 ic+AnpERUoBaWMpNmC2aEGeMMWq6Qnz4FCozkmhRStfC1q501JfllQvAz40v6a9zMa+ZE9N4b
 eVR7qc1FPZIoBv1aUAH2VDqh+Ww=
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/23 16:27, Thomas Zimmermann wrote:
>>> But the work I do within fbdev is mostly for improving DRM.
>>
>> Sure.
>>
>>> For the
>>> other issues in this file, I don't think that matroxfb should even be
>>> around any longer. Fbdev has been deprecated for a long time. But a
>>> small number of drivers are still in use and we still need its
>>> framebuffer console. So someone should either put significant effort
>>> into maintaining fbdev, or it should be phased out. But neither is
>>> happening.
>>
>> You're wrong.
>

> I'm not. I don't claim that these drivers are all broken. But fbdev
> as a whole is bit-rotting and no one attempts to address this. There
> are several recent examples of this:
>
> * I recently send out a 100-patches series to improve parameter
> parsing and avoid memory leaks. That got shot down. I didn't attempt
> to support parameter parsing for module builds.

Your work is appreciated and it wasn't shot down, but it wasn't perfect ei=
ther.

> * There's been a 15-yrs old bug in fbdev's read/write where they
> return an incorrect value.

?

> * See the other discussion on this patchset on the state of hitfb.
>
> * The fbdev code I recently cleaned up had bugs in how it uses some
> of fbdev's basic building blocks (see the screen_base/screen_buffer
> confusion).

As you said... some (little-used/outdated) drivers may have issues
which of course show up if one starts to clean up, as you do.
On a per-driver basis it can make sense to drop a specific driver.

> * <asm-generic/fb.h> has been in the tree since 2009 and no one
> attempted to include it until now.
>
> None of this is a sign of good maintenance.
> As I've worked on DRM's fbdev emulation a lot, I try to be a good
> kernel citizen and clean up in fbdev as well when I see a problem.> But =
I'd really like to see most of these drivers being moved into
> staging and deleted soon afterwards. Users will complain about those
> drivers that are really still required. Those might be worth to spend
> effort on.

I'd really like to see a way forward and get the required drivers over to
DRM, e.g. based on your simpledrm driver.
If there is a way to get basic on-screen 2D bitblt and fillrect support,
it would drop the need for most of the fbdev drivers.
The current way of bitblt'ing from a buffer on regular basis istoo slow fo=
r such older cards. Even on new hardware in emulators there
is a big slowdown visible.

>> You don't mention that for most older machines DRM isn't an
>> acceptable way to go due to it's limitations, e.g. it's low-speed
>> due to missing 2D-acceleration for older cards and and it's
>> incapability to change screen resolution at runtime (just to name
>> two of the bigger limitations here).
>
> You can change resolution at runtime; just not through fbdev ioctls.
> There's no technical limitation here. No one found any use for this,
> so it's not there.

fbdev drivers would need that when ported to DRM.
>> So, unless we somehow find a good way to move such drivers over to
>> DRM (with a set of minimal 2D acceleration), they are still
>> important.
>
> 2d acceleration is mostly useful for the framebuffer console.

and X11

> You can
> do that with DRM and drivers have (nouveau). It just didn't make a
> meaningful difference in most cases.

if nouveau got it, can't it be done for simpledrm in a generic way too?

>> Actually, I just did test matroxfb and pm2fb successfully a few
>> days back, and they worked. For some smaller issues I've prepared
>> patches, which are on hold due conflicts with your latest
>> file-move-around- and whitespace-changes which are partly in
>> drm-misc. And I do have some upcoming additional patches for
>> console support.

Helge
